defmodule HiringTestBackendWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :hiring_test_backend,
    module: HiringTestBackend.Auth.Guardian,
    error_handler: HiringTestBackendWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
