defmodule HiringTestBackendWeb.Auth do
  @moduledoc """
  Geração e verificação de tokens JWT.
  """

  @jwt_secret Application.compile_env!(:hiring_test_backend, :jwt_secret)

  def generate_jwt(user) do
    signer = Joken.Signer.create("HS256", @jwt_secret)

    claims = %{
      "user_id" => user.id,
      "exp" => DateTime.utc_now() |> DateTime.add(3600, :second) |> DateTime.to_unix()
    }

    case Joken.encode_and_sign(claims, signer) do
      {:ok, token, _claims} ->
        {:ok, token}

      {:error, reason} ->
        {:error, reason}
    end
  end

end
