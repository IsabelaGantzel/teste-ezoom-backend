<?php
namespace App\Controllers;

use App\Models\UserModel;
use CodeIgniter\RESTful\ResourceController;
use Firebase\JWT\JWT;

class Auth extends ResourceController
{
    protected $format = 'json';
    protected $userModel;

    public function __construct()
    {
        $this->userModel = new UserModel();
    }

    public function login()
    {
        $req = $this->request->getJSON(true);
        if (!isset($req['email'], $req['password'])) {
            return $this->failValidationErrors('email e password são obrigatórios');
        }

        $user = $this->userModel->findByEmail($req['email']);

        if (! $user) {
            return $this->failNotFound('Usuário não encontrado. Verifique se o register funcionou.');
        }

        if (! password_verify($req['password'], $user['password_hash'])) {
            return $this->failUnauthorized('Senha incorreta. Hash armazenado não confere.');
        }

        $payload = [
            'iat' => time(),
            'exp' => time() + 3600,
            'user' => [
                'id' => $user['id'],
                'email' => $user['email'],
                'role'  => $user['role'],
            ],
        ];

        try {
            $secret = env('JWT_SECRET');
            $token = \Firebase\JWT\JWT::encode($payload, $secret, 'HS256');

            return $this->respondCreated([
                'message' => 'Login bem-sucedido',
                'token' => $token,
                'token_created' => true,
                'user' => [
                    'id'    => $user['id'],
                    'email' => $user['email'],
                    'role'  => $user['role'],
                ],
            ]);
        } catch (\Throwable $e) {
            log_message('error', 'JWT encode failed: ' . $e->getMessage());
            return $this->response
                ->setStatusCode(500)
                ->setJSON([
                        'error' => 'Não foi possível gerar o token',
                        'token_created' => false,
                    ]);
        }
    }

    public function register()
    {
        $req = $this->request->getJSON(true);

        $rules = [
            'email'    => 'required|valid_email|is_unique[users.email]',
            'password' => 'required|min_length[6]',
            'role'     => 'required|in_list[user,admin]',
        ];

        if (! $this->validate($rules)) {
            return $this->failValidationErrors($this->validator->getErrors());
        }

        $this->userModel->insert([
            'email'         => $req['email'],
            'password_hash' => password_hash($req['password'], PASSWORD_DEFAULT),
            'role'          => $req['role'],
        ]);

        return $this->respondCreated([
            'message' => 'Usuário cadastrado com sucesso',
        ]);
    }
}
