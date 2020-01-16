defmodule TeacherWeb.NameView do
  use TeacherWeb, :view

  def number_formatter(entries) do
    Number.Human.number_to_human(entries)
  end

end
