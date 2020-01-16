defmodule TeacherWeb.TitleController do
  use TeacherWeb, :controller

  alias Teacher.Titles
  alias Teacher.Titles.Title

  def index(conn, params) do
    page = Title
           |> Teacher.Repo.paginate(params)

    render conn, :index,
           page: page,
           titles: page.entries,
           page_number: page.page_number,
           page_size: page.page_size,
           total_pages: page.total_pages,
           total_entries: page.total_entries
  end

  def new(conn, _params) do
    changeset = Titles.change_title(%Title{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"title" => title_params}) do
    case Titles.create_title(title_params) do
      {:ok, title} ->
        conn
        |> put_flash(:info, "Title created successfully.")
        |> redirect(to: Routes.title_path(conn, :show, title))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"tconst" => tconst}) do
    title = Titles.get_title!(tconst)
    render(conn, "show.html", title: title)
  end

  def edit(conn, %{"tconst" => tconst}) do
    title = Titles.get_title!(tconst)
    changeset = Titles.change_title(title)
    render(conn, "edit.html", title: title, changeset: changeset)
  end

  def update(conn, %{"tconst" => tconst, "title" => title_params}) do
    title = Titles.get_title!(tconst)

    case Titles.update_title(title, title_params) do
      {:ok, title} ->
        conn
        |> put_flash(:info, "Title updated successfully.")
        |> redirect(to: Routes.title_path(conn, :show, title))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", title: title, changeset: changeset)
    end
  end

  def delete(conn, %{"tconst" => tconst}) do
    title = Titles.get_title!(tconst)
    {:ok, _title} = Titles.delete_title(title)

    conn
    |> put_flash(:info, "Title deleted successfully.")
    |> redirect(to: Routes.title_path(conn, :index))
  end
end
