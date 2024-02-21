defmodule LambcastWeb.PageController do
  use LambcastWeb, :controller
  use Tesla
  Tesla.Builder.plug(Tesla.Middleware.BaseUrl, "https://hub.farcaster.standardcrypto.vc:2281/v1")
  Tesla.Builder.plug(Tesla.Middleware.JSON)

  def home(conn, _params) do
    {:ok, data} = Tesla.get("https://hub.farcaster.standardcrypto.vc:2281/v1/castsByFid?fid=2")
    # render(conn, :home, layout: false)
    text(conn, "#{data.body}")
  end
end
