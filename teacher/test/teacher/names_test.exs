defmodule Teacher.NamesTest do
  use Teacher.DataCase

  alias Teacher.Names

  describe "names" do
    alias Teacher.Names.Name

    @valid_attrs %{birthyear: "some birthyear", deathyear: "some deathyear", knownfortitles: "some knownfortitles", nconst: "some nconst", primaryname: "some primaryname", primaryprofession: "some primaryprofession"}
    @update_attrs %{birthyear: "some updated birthyear", deathyear: "some updated deathyear", knownfortitles: "some updated knownfortitles", nconst: "some updated nconst", primaryname: "some updated primaryname", primaryprofession: "some updated primaryprofession"}
    @invalid_attrs %{birthyear: nil, deathyear: nil, knownfortitles: nil, nconst: nil, primaryname: nil, primaryprofession: nil}

    def name_fixture(attrs \\ %{}) do
      {:ok, name} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Names.create_name()

      name
    end

    test "list_names/0 returns all names" do
      name = name_fixture()
      assert Names.list_names() == [name]
    end

    test "get_name!/1 returns the name with given id" do
      name = name_fixture()
      assert Names.get_name!(name.id) == name
    end

    test "create_name/1 with valid data creates a name" do
      assert {:ok, %Name{} = name} = Names.create_name(@valid_attrs)
      assert name.birthyear == "some birthyear"
      assert name.deathyear == "some deathyear"
      assert name.knownfortitles == "some knownfortitles"
      assert name.nconst == "some nconst"
      assert name.primaryname == "some primaryname"
      assert name.primaryprofession == "some primaryprofession"
    end

    test "create_name/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Names.create_name(@invalid_attrs)
    end

    test "update_name/2 with valid data updates the name" do
      name = name_fixture()
      assert {:ok, %Name{} = name} = Names.update_name(name, @update_attrs)
      assert name.birthyear == "some updated birthyear"
      assert name.deathyear == "some updated deathyear"
      assert name.knownfortitles == "some updated knownfortitles"
      assert name.nconst == "some updated nconst"
      assert name.primaryname == "some updated primaryname"
      assert name.primaryprofession == "some updated primaryprofession"
    end

    test "update_name/2 with invalid data returns error changeset" do
      name = name_fixture()
      assert {:error, %Ecto.Changeset{}} = Names.update_name(name, @invalid_attrs)
      assert name == Names.get_name!(name.id)
    end

    test "delete_name/1 deletes the name" do
      name = name_fixture()
      assert {:ok, %Name{}} = Names.delete_name(name)
      assert_raise Ecto.NoResultsError, fn -> Names.get_name!(name.id) end
    end

    test "change_name/1 returns a name changeset" do
      name = name_fixture()
      assert %Ecto.Changeset{} = Names.change_name(name)
    end
  end
end
