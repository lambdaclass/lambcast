defmodule LambcastWeb.UserController do
  use LambcastWeb, :controller
  alias Lambcast.Messages
  alias Lambcast.Users

  def index(conn, %{"username" => username}) do
    user = Users.get_user!(username)
    casts = Messages.get_casts!(user.fid)

    user = Map.put(user, :casts, casts)

    conn
    |> assign(:user, user)
    |> render(:index)
  end
end
