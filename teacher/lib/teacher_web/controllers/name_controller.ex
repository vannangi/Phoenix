defmodule TeacherWeb.NameController do
  use TeacherWeb, :controller

  alias Teacher.Names
  alias Teacher.Names.Name

  def index(conn, params) do

    page = Name
           |> Teacher.Repo.paginate(params)

    # names = Names.list_names()
    render conn, :index,
           page: page,
           names: page.entries,
           page_number: page.page_number,
           page_size: page.page_size,
           total_pages: page.total_pages,
           total_entries: page.total_entries
  end

  def new(conn, _params) do
    changeset = Names.change_name(%Name{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"name" => name_params}) do
    case Names.create_name(name_params) do
      {:ok, name} ->
        conn
        |> put_flash(:info, "Name created successfully.")
        |> redirect(to: Routes.name_path(conn, :show, name))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"nconst" => nconst}) do
    name = Names.get_name!(nconst)
    render(conn, "show.html", name: name)
  end

  def edit(conn, %{"nconst" => nconst}) do
    name = Names.get_name!(nconst)
    changeset = Names.change_name(name)
    render(conn, "edit.html", name: name, changeset: changeset)
  end

  def update(conn, %{"nconst" => nconst, "name" => name_params}) do
    name = Names.get_name!(nconst)

    case Names.update_name(name, name_params) do
      {:ok, name} ->
        conn
        |> put_flash(:info, "Name updated successfully.")
        |> redirect(to: Routes.name_path(conn, :show, name))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", name: name, changeset: changeset)
    end
  end

  def delete(conn, %{"nconst" => nconst}) do
    name = Names.get_name!(nconst)
    {:ok, _name} = Names.delete_name(name)

    conn
    |> put_flash(:info, "Name deleted successfully.")
    |> redirect(to: Routes.name_path(conn, :index))
  end
end
