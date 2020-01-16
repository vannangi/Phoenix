defmodule Teacher.Names do

  import Ecto.Query, warn: false
  alias Teacher.Repo

  alias Teacher.Names.Name

  def list_names do
    Name
    |> limit(1000)
    |> Repo.all()
  end

  def get_name!(nconst), do: Repo.get!(Name, nconst)

  def create_name(attrs \\ %{}) do
    %Name{}
    |> Name.changeset(attrs)
    |> Repo.insert()
  end

  def update_name(%Name{} = name, attrs) do
    name
    |> Name.changeset(attrs)
    |> Repo.update()
  end

  def delete_name(%Name{} = name) do
    Repo.delete(name)
  end

  def change_name(%Name{} = name) do
    Name.changeset(name, %{})
  end
end
