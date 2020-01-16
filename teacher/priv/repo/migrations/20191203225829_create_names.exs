defmodule Teacher.Repo.Migrations.CreateNames do
  use Ecto.Migration

  def change do
    create table(:names) do
      add :nconst, :string
      add :primaryname, :string
      add :birthyear, :string
      add :deathyear, :string
      add :primaryprofession, :string
      add :knownfortitles, :string

      timestamps()
    end

  end
end
