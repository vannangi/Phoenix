defmodule Teacher.Repo.Migrations.CreateTitles do
  use Ecto.Migration

  def change do
    create table(:titles) do
      add :tconst, :string
      add :titletype, :string
      add :primarytitle, :string
      add :originaltitle, :string
      add :isadult, :string
      add :startyear, :string
      add :endyear, :string
      add :runtimes, :string
      add :genres, :string

      timestamps()
    end

  end
end
