import Config

log_dir = Path.expand("log", File.cwd!())

config :logger,
  backends: [
    {LoggerFileBackend, :info_log},
    {LoggerFileBackend, :error_log}
  ]

config :logger, :info_log,
  path: Path.join(log_dir, "game.log"),
  level: :info,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :logger, :error_log,
  path: Path.join(log_dir, "game_error.log"),
  level: :error,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]
