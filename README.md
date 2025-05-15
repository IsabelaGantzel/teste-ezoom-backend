# Teste Técnico – Backend (CodeIgniter 4)

Este repositório contém a API RESTful desenvolvida em PHP utilizando CodeIgniter 4, como parte do desafio técnico para a vaga de Desenvolvedor Fullstack Pleno na Ezoom.

## ⚙️ Tecnologias

- PHP 8.4
- CodeIgniter 4.6.1
- MySQL (via XAMPP)
- Composer

## 📌 Funcionalidades

- Envio de notificações para um usuário específico
- Listagem de notificações por usuário
- Marcar notificações como lidas
- API RESTful com formato JSON

## 🚀 Como rodar o projeto

### 1. Clone o repositório

```bash
git clone https://github.com/IsabelaGantzel/teste-ezoom-backend.git
cd teste-ezoom-backend
```

### 2. Instale as dependências

   ```bash
   composer install
   ```

### 3. Configure variáveis de ambiente

   * Copie `.env.example` para `.env`
   * Ajuste as credenciais do banco de dados (`DB_HOST`, `DB_USER`, `DB_PASS`, `DB_NAME`)
   * Defina `JWT_SECRET` (se implementar autenticação opcional)

### 4. Banco de Dados

   * Crie o banco no MySQL
   * Execute as migrations:

     ```bash
     php spark migrate
     ```
   * (Opcional) Rode seeders:

     ```bash
     php spark db:seed NotificationSeeder
     ```

### 5. Inicie o servidor

   ```bash
   php spark serve
   ```

   * A API estará disponível em `http://localhost:8080`

## Rotas da API

### 1. Enviar Notificação

* **Método:** `POST`
* **URL:** `/notifications`
* **Body (JSON):**

  ```json
  {
    "user_id": 1,
    "title": "Novo Aviso",
    "message": "Você tem uma nova mensagem"
  }
  ```
* **Resposta (201):**

  ```json
  {
    "id": 10,
    "user_id": 1,
    "title": "Novo Aviso",
    "message": "Você tem uma nova mensagem",
    "sent_at": "2025-05-15T14:30:00Z",
    "read": false
  }
  ```

### 2. Listar Notificações

* **Método:** `GET`
* **URL:** `/notifications?user_id=1`
* **Resposta (200):** Lista ordenada por data mais recente

  ```json
  [
    {
      "id": 10,
      "title": "Novo Aviso",
      "message": "Você tem uma nova mensagem",
      "sent_at": "2025-05-15T14:30:00Z",
      "read": false
    },
    {
      "id": 9,
      "title": "Lembrete",
      "message": "Reunião às 16h",
      "sent_at": "2025-05-14T09:00:00Z",
      "read": true
    }
  ]
  ```

### 3. Marcar Notificação como Lida

* **Método:** `POST`
* **URL:** `/notifications/{id}/read`
* **Body (JSON):**

  ```json
  { "read": true }
  ```
* **Resposta (200):**

  ```json
  { "success": true }
  ```

## Estrutura de Dados

Tabela `notifications`:

| Coluna   | Tipo                | Descrição                  |
| -------- | ------------------- | -------------------------- |
| id       | INT AUTO\_INCREMENT | Chave primária             |
| user\_id | INT                 | ID do usuário destinatário |
| title    | VARCHAR(255)        | Título da notificação      |
| message  | TEXT                | Conteúdo da mensagem       |
| sent\_at | DATETIME            | Data e hora do envio       |
| read     | TINYINT(1)          | 0 = não lida, 1 = lida     |

---

## Testes e Uso

* Utilize Postman ou cURL para testar as rotas acima.
* Exemplo com cURL:

  ```bash
  curl -X POST http://localhost:8080/notifications \
    -H 'Content-Type: application/json' \
    -d '{"user_id":1,"title":"Olá","message":"Teste"}'
  ```

