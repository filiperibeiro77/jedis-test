defmodule HiringTestBackend.Repo do
  use Ecto.Repo,
    otp_app: :hiring_test_backend,
    adapter: Ecto.Adapters.Postgres
end
