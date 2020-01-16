defmodule TeacherWeb.PageController do
  use TeacherWeb, :controller  
  alias Teacher.Names

  def index(conn, _params) do
 	
    names = Names.list_names()
    		|> Enum.take_random(8)

    render(conn, "index.html", names: names)
  end
end
