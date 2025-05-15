<?php namespace App\Filters;

use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use CodeIgniter\Filters\FilterInterface;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

class JwtAuth implements FilterInterface
{
    public function before(RequestInterface $request, $arguments = null)
    {
        $header = $request->getHeaderLine('Authorization');
        if ($header && preg_match('/Bearer\s(\S+)/', $header, $m)) {
            $token = $m[1];
        } else {
            $token = $request->getCookie('jwt');
        }

        if (! $token) {
            return service('response')
                ->setStatusCode(401)
                ->setJSON([
                    'error'         => 'Token não enviado',
                    'token_created' => false,
                ]);
        }

        try {
            $secret  = env('JWT_SECRET');
            $decoded = JWT::decode($token, new Key($secret, 'HS256'));

            $request->user = [
                'id'    => $decoded->user->id,
                'email' => $decoded->user->email,
                'role'  => $decoded->user->role,
            ];
        } catch (\Throwable $e) {
            return service('response')
                ->setStatusCode(401)
                ->setJSON([
                    'error'         => 'Token inválido: ' . $e->getMessage(),
                    'token_created' => false,
                ]);
        }
    }

    public function after(RequestInterface $request, ResponseInterface $response, $arguments = null)
    {
    }
}
