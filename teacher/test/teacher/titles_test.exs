defmodule Teacher.TitlesTest do
  use Teacher.DataCase

  alias Teacher.Titles

  describe "titles" do
    alias Teacher.Titles.Title

    @valid_attrs %{endyear: "some endyear", genres: "some genres", isadult: "some isadult", originaltitle: "some originaltitle", primarytitle: "some primarytitle", runtimes: "some runtimes", startyear: "some startyear", tconst: "some tconst", titletype: "some titletype"}
    @update_attrs %{endyear: "some updated endyear", genres: "some updated genres", isadult: "some updated isadult", originaltitle: "some updated originaltitle", primarytitle: "some updated primarytitle", runtimes: "some updated runtimes", startyear: "some updated startyear", tconst: "some updated tconst", titletype: "some updated titletype"}
    @invalid_attrs %{endyear: nil, genres: nil, isadult: nil, originaltitle: nil, primarytitle: nil, runtimes: nil, startyear: nil, tconst: nil, titletype: nil}

    def title_fixture(attrs \\ %{}) do
      {:ok, title} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Titles.create_title()

      title
    end

    test "list_titles/0 returns all titles" do
      title = title_fixture()
      assert Titles.list_titles() == [title]
    end

    test "get_title!/1 returns the title with given id" do
      title = title_fixture()
      assert Titles.get_title!(title.id) == title
    end

    test "create_title/1 with valid data creates a title" do
      assert {:ok, %Title{} = title} = Titles.create_title(@valid_attrs)
      assert title.endyear == "some endyear"
      assert title.genres == "some genres"
      assert title.isadult == "some isadult"
      assert title.originaltitle == "some originaltitle"
      assert title.primarytitle == "some primarytitle"
      assert title.runtimes == "some runtimes"
      assert title.startyear == "some startyear"
      assert title.tconst == "some tconst"
      assert title.titletype == "some titletype"
    end

    test "create_title/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Titles.create_title(@invalid_attrs)
    end

    test "update_title/2 with valid data updates the title" do
      title = title_fixture()
      assert {:ok, %Title{} = title} = Titles.update_title(title, @update_attrs)
      assert title.endyear == "some updated endyear"
      assert title.genres == "some updated genres"
      assert title.isadult == "some updated isadult"
      assert title.originaltitle == "some updated originaltitle"
      assert title.primarytitle == "some updated primarytitle"
      assert title.runtimes == "some updated runtimes"
      assert title.startyear == "some updated startyear"
      assert title.tconst == "some updated tconst"
      assert title.titletype == "some updated titletype"
    end

    test "update_title/2 with invalid data returns error changeset" do
      title = title_fixture()
      assert {:error, %Ecto.Changeset{}} = Titles.update_title(title, @invalid_attrs)
      assert title == Titles.get_title!(title.id)
    end

    test "delete_title/1 deletes the title" do
      title = title_fixture()
      assert {:ok, %Title{}} = Titles.delete_title(title)
      assert_raise Ecto.NoResultsError, fn -> Titles.get_title!(title.id) end
    end

    test "change_title/1 returns a title changeset" do
      title = title_fixture()
      assert %Ecto.Changeset{} = Titles.change_title(title)
    end
  end
end
