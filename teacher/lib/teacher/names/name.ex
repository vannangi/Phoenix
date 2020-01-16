defmodule Teacher.Names.Name do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Phoenix.Param, key: :nconst}
  @primary_key false
  schema "names" do
    field :nconst, :string, primary_key: true
    field :birthyear, :string
    field :deathyear, :string
    field :knownfortitles, :string
    field :primaryname, :string
    field :primaryprofession, :string
    field :imageurl, :string

  end

  @doc false
  def changeset(name, attrs) do
    name
    |> cast(attrs, [:nconst, :primaryname, :birthyear, :deathyear, :primaryprofession, :knownfortitles, :imageurl])
    |> validate_required([:nconst, :primaryname, :birthyear, :deathyear, :primaryprofession, :knownfortitles, :imageurl])
  end
end
