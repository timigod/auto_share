defmodule AutoShare.FetchPosts do

  def perform do

  end

  def get_posts(limit) do
    posts_url(limit)
    |> HTTPoison.get
    |> handle_json
    |> IO.inspect
  end

  defp posts_url(limit) do
    "https://medium.com/@timigod/latest?format=json&limit=#{limit}"
  end

  defp handle_json({:ok, %{status_code: 200, body: body}}) do
    new_body = String.replace(body, "])}while(1);</x>", "")
    {:ok, Poison.Parser.parse!(new_body), %{keys: :atoms!}}
  end

  defp handle_json({:error, %HTTPoison.Error{reason: reason}}) do
    IO.inspect(reason)
  end
end