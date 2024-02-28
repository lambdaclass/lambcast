defmodule LambcastWeb.SearchController do
  use LambcastWeb, :controller
  use LambcastWeb, :live_view

  def home(conn, _params) do
    render(conn, :home, form: %{"search" => ""}, layout: false)
  end

  def redirect_to_user(conn, %{"search" => user}) do
    Phoenix.Controller.redirect(
      conn,
      to: ~p"/#{user}"
    )
  end
end
