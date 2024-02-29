defmodule LambcastWeb.UserController do
  use LambcastWeb, :controller
  alias Lambcast.Users

  def index(conn, %{"username" => username}) do
    case Users.get_user(username) do
      user ->
        conn
        |> assign(:user, user)
        |> render(:index)
    end
  end
end
