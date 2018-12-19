defmodule AutoShare.Repo do
  use Ecto.Repo,
    otp_app: :auto_share,
    adapter: Ecto.Adapters.Postgres
end
