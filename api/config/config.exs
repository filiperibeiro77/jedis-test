# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :hiring_test_backend,
  ecto_repos: [HiringTestBackend.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :hiring_test_backend, HiringTestBackendWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: HiringTestBackendWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: HiringTestBackend.PubSub,
  live_view: [signing_salt: "45xW6UbQ"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :hiring_test_backend, HiringTestBackend.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"

config :hiring_test_backend, HiringTestBackend.Auth.Guardian,
  issuer: "hiring_test_backend",
  secret_key: "ixSWsvdGkiKBrya4SeZuiXWCUnUt/IhzdV9CPVHM2aGQR1OoQbokhDW2p1Qx8Lp"

config :hiring_test_backend, HiringTestBackendWeb.Auth,
  secret_key: "ixSWsvdGkiKBrya4SeZuiXWCUnUt/IhzdV9CPVHM2aGQR1OoQbokhDW2p1Qx8Lp"

config :hiring_test_backend, :jwt_secret, "ixSWsvdGkiKBrya4SeZuiXWCUnUt/IhzdV9CPVHM2aGQR1OoQbokhDW2p1Qx8Lp"

config :joken, default_signer: "ixSWsvdGkiKBrya4SeZuiXWCUnUt/IhzdV9CPVHM2aGQR1OoQbokhDW2p1Qx8Lp"
