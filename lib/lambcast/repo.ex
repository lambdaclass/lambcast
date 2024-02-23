defmodule Lambcast.Repo do
  use Ecto.Repo,
    otp_app: :lambcast,
    adapter: Ecto.Adapters.Postgres
end
