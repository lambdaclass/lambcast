defmodule LambcastWeb.PageController do
  use LambcastWeb, :controller
  use LambcastWeb, :live_view

  def home(conn, _params) do
    render(conn, :home, data: %{"search" => "search_data"}, layout: false)
  end

  def home(conn, %{"search" => user}) do
    Phoenix.PageController.redirect(
      conn,
      Phoenix.Controller.redirect(conn, to: ~p"/#{user}")
    )
  end
end
