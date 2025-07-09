# HiringTestBackend

Este projeto é uma aplicação web de lista de tarefas (Todo List) que utiliza **Elixir Phoenix**, **Ecto** e **PostgreSQL** no backend, e **React** no frontend.

---

## Requisitos

Para rodar este projeto, você precisará ter as seguintes ferramentas instaladas:

* **Elixir** 1.17+
* **Erlang/OTP** 24+
* **PostgreSQL** 12+
* **Node.js** 18+
* **npm** ou **yarn**
* **Git**

---

## Configuração e Instalação

Siga os passos abaixo para configurar e instalar a aplicação:

### 1. Clone o repositório

```bash
git clone [https://github.com/seu-usuario/hiring_test_backend.git](https://github.com/seu-usuario/hiring_test_backend.git)
cd hiring_test_backend
```
### 2. Configurar o Backend (Phoenix)

#### Instale as dependências Elixir

```bash
mix deps.get
```
#### Configure o banco de dados

Ajuste o arquivo `config/dev.exs` com as credenciais do seu PostgreSQL.

Crie o banco de dados e execute as migrações:

```bash
mix ecto.create
mix ecto.migrate
```

#### Rode os seeds
```bash
mix run priv/repo/seeds.exs
```


### 3. Rodar o Backend

Bash

```
mix phx.server

```

Por padrão, o backend estará rodando em: **http://localhost:4000**

### 4. Configurar e Rodar o Frontend (React)

Navegue até a pasta do frontend:

```
cd frontend
```

Instale as dependências:

```
npm install
# ou
yarn install

```

Inicie o frontend:

```
npm start
# ou
yarn start

```

Por padrão, o frontend estará em: **http://localhost:3000**

----------

## Uso

1.  Acesse o frontend no seu navegador.
    
2.  Faça login com o **email:** joao@email.com e **senha**: senha123.
    
3.  Crie, visualize, atualize e exclua tarefas (todos).
    
| Método | URL | Descrição|
|--|--|--|
| `POST` | `/api/login` | Autenticação (JWT token)|
| `GET` | `/api/todos` | Listar todos|
| `POST` | `api/todos` | Criar novo todo|
| `GET` | `/api/todos/:id` | Detalhar todo|
| `PUT` | `/api/todos/:id` | Atualizar todo|
| `DELETE` | `/api/todos/:id` | Autenticação (JWT token)|
