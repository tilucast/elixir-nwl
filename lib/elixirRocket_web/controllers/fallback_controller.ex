defmodule ElixirRocketWeb.FallbackController do
  use ElixirRocketWeb, :controller

  def call(connection, {:error, result}) do
     connection
     |> put_status(:bad_request)
     |> put_view(ElixirRocketWeb.ErrorView)
     |> render("400.json", result: result)
  end
end
