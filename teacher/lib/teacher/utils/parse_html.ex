defmodule Teacher.Utils.ParseHtml do

  def get_img(type,value) do
    url = "https://www.imdb.com/#{type}/#{value}/"

    case HTTPoison.get(url,[timeout: 30_000]) do
      {:ok, %HTTPoison.Response{status_code: 200,body: body}} ->

        url_pic = body
                  |> Floki.find("#name-overview-widget img#name-poster")
        url_no_pic1 = body
                    |> Floki.find("#name-overview-widget img.no-pic-image")
        url_no_pic2 = body
                    |> Floki.find("#img_primary img.no-pic-image")
        url_pic ++ url_no_pic1 ++ url_no_pic2
        |> Floki.attribute("src")
    end
  end

end
