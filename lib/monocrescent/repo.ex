defmodule Monocrescent.Repo do
  use Ecto.Repo,
    otp_app: :monocrescent,
    adapter: Ecto.Adapters.Postgres
end
