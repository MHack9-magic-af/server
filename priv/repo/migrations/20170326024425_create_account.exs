defmodule Reassurance.Repo.Migrations.CreateAccount do
  use Ecto.Migration

  def change do
    create table(:accounts) do

      timestamps()
    end

  end
end
