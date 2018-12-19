defmodule AutoShare.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:sources) do
      add :name, :string

      timestamps()
    end

    create table(:posts) do
      add :title, :string
      add :url, :string
      add :description, :string
      add :can_share, :boolean, default: true, null: false
      add :source_id, references(:sources)

      timestamps()
    end
  end
end
