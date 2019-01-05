defmodule AutoShare.FetchPosts do

  def perform do

  end

  def get_posts(limit) do
    posts_url(limit)
    |> HTTPoison.get
    |> handle_json
    |> print_single_post
  end

  defp posts_url(limit) do
    "https://medium.com/@timigod/latest?format=json&limit=#{limit}"
  end

  defp handle_json({:ok, %{status_code: 200, body: body}}) do
    new_body = String.replace(body, "])}while(1);</x>", "")
    {:ok, Poison.Parser.parse!(new_body)}
  end

  defp handle_json({:error, %HTTPoison.Error{reason: reason}}) do
    IO.inspect(reason)
  end

  defp print_single_post(body) do
    IO.inspect(body["references"])
  end
end