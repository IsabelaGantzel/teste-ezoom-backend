<?php

namespace App\Controllers;

use App\Models\NotificationModel;
use CodeIgniter\RESTful\ResourceController;

class Notification extends ResourceController
{
    protected $model;

    public function __construct()
    {
        $this->model = new NotificationModel();
    }

    protected $format = 'json';

    public function create()
    {
        $data = $this->request->getJSON(true);

        if (!isset($data['user_id'], $data['title'], $data['message'])) {
            return $this->failValidationErrors("Campos obrigatórios: user_id, title, message");
        }

        $data['created_at'] = date('Y-m-d H:i:s');
        $this->model->insert($data);

        return $this->respondCreated(['message' => 'Notificação enviada com sucesso']);
    }

    public function show($userId = null)
    {
        $notifications = $this->model
            ->where('user_id', $userId)
            ->orderBy('created_at', 'DESC')
            ->findAll();

        return $this->respond($notifications);
    }

    public function update($id = null)
    {
        $updated = $this->model->update($id, ['is_read' => true]);

        if (!$updated) {
            return $this->failNotFound("Notificação não encontrada");
        }

        return $this->respond(['message' => 'Notificação marcada como lida']);
    }
}
