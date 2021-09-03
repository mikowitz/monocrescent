defmodule Monocrescent.Repo.Migrations.CreateEmails do
  use Ecto.Migration

  def change do
    create table(:emails) do
      add :email_address, :string
      add :name, :string

      timestamps()
    end

  end
end
