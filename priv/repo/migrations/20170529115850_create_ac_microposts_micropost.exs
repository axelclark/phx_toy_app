defmodule PhxToyApp.Repo.Migrations.CreatePhxToyApp.AcMicroposts.Micropost do
  use Ecto.Migration

  def change do
    create table(:ac_microposts_microposts) do
      add :content, :text
      add :user_id, references(:accounts_users, on_delete: :nothing)

      timestamps()
    end

    create index(:ac_microposts_microposts, [:user_id])
  end
end
