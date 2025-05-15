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
        $me   = $this->request->user;
        $body = $this->request->getJSON(true);

        $rules = [
            'title'   => 'required|string|max_length[255]',
            'message' => 'required|string',
        ];
        if ($me['role'] === 'admin') {
            $rules['user_id'] = 'required|integer';
        }

        if (! $this->validate($rules)) {
            return $this->failValidationErrors($this->validator->getErrors());
        }

        $targetUser = ($me['role'] === 'admin')
            ? (int) $body['user_id']
            : $me['id'];

        $data = [
            'user_id'    => $targetUser,
            'title'      => $body['title'],
            'message'    => $body['message'],
            'created_at' => date('Y-m-d H:i:s'),
        ];

        try {
            $insertId     = $this->model->insert($data);
            $notification = $this->model->find($insertId);

            return $this->respondCreated([
                'message'      => 'Notificação enviada',
                'notification' => $notification,
            ]);
        } catch (\Throwable $e) {
            log_message('error', $e->getMessage());
            return $this->failServerError('Erro interno ao salvar notificação');
        }
    }


    public function show($userId = null)
    {
        $notifications = $this->model
            ->where('user_id', $userId)
            ->orderBy('created_at', 'DESC')
            ->findAll();

        return $this->respond([
            'data' => $notifications,
        ]);
    }

    public function update($id = null)
    {
        $me = $this->request->user;
        $notification = $this->model->find($id);
        if (!$notification || $notification['user_id'] != $me['id']) {
            return $this->failForbidden('Notificação não pertence a você');
        }
        $this->model->update($id, ['is_read' => true]);

        $updated = $this->model->update($id, ['is_read' => true]);

        if (!$updated) {
            return $this->failNotFound("Notificação não encontrada");
        }

        return $this->respond(['message' => 'Notificação marcada como lida']);
    }
}
