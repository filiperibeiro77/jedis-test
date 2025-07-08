defmodule HiringTestBackendWeb.SessionController do
  use HiringTestBackendWeb, :controller

  alias HiringTestBackend.Accounts
  alias HiringTestBackendWeb.Auth

  def create(conn, %{"email" => email, "password" => password}) do
    case Accounts.authenticate_user(email, password) do
      {:ok, user} ->
        case Auth.generate_jwt(user) do
          {:ok, token} ->  # aqui só token, pois seu generate_jwt retorna {:ok, token} no seu código
            json(conn, %{token: token})

          {:error, _reason} ->
            conn
            |> put_status(:internal_server_error)
            |> json(%{error: "Erro ao gerar token"})
        end

      {:error, _reason} ->
        conn
        |> put_status(:unauthorized)
        |> json(%{error: "Login falhou, tente novamente."})
    end
  end
end
