defmodule ElixirRocket.Repo do
  use Ecto.Repo,
    otp_app: :elixirRocket,
    adapter: Ecto.Adapters.Postgres
end
