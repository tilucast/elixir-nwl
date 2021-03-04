defmodule ElixirRocketWeb.UsersController do
  use ElixirRocketWeb, :controller

  alias ElixirRocket.User

  action_fallback ElixirRocketWeb.FallbackController

  def create(connection, params) do
    with {:ok, %User{} = user} <- ElixirRocket.create_user(params) do
      connection
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
