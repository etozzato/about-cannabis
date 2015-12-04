use Mix.Config

config :about_cannabis, AboutCannabis.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [scheme: "https", host: "about-cannabis.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/manifest.json",
  secret_key_base: System.get_env("SECRET_KEY_BASE")

config :logger, level: :info

config :about_cannabis, AboutCannabis.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: 20
