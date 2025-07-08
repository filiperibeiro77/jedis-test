defmodule HiringTestBackend.Auth.Guardian do
  use Guardian, otp_app: :hiring_test_backend

  alias HiringTestBackend.Accounts

  def subject_for_token(user, _claims) do
    {:ok, to_string(user.id)}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    case Accounts.get_user!(id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
