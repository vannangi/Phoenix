defmodule Teacher.Titles.Title do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Phoenix.Param, key: :tconst}
  @primary_key false
  schema "titles" do
    field :endyear, :string
    field :genres, :string
    field :isadult, :string
    field :originaltitle, :string
    field :primarytitle, :string
    field :runtimeminutes, :string
    field :startyear, :string
    field :tconst, :string, primary_key: true
    field :titletype, :string

  end

  @doc false
  def changeset(title, attrs) do
    title
    |> cast(attrs, [:tconst, :titletype, :primarytitle, :originaltitle, :isadult, :startyear, :endyear, :runtimeminutes, :genres])
    |> validate_required([:tconst, :titletype, :primarytitle, :originaltitle, :isadult, :startyear, :endyear, :runtimeminutes, :genres])
  end
end
