defmodule LambcastWeb.PageController do
  use LambcastWeb, :controller
  alias Farcaster.Rpc

  def home(conn, _params) do
    user =
      Rpc.get_request("userNameProofByName?name=vitalik.eth")

    messages = Rpc.get_request("castsByFid?fid=#{user["fid"]}" <> "&reverse=1")
    IO.puts(messages["data"]["castAddBody"]["mentions"])

    conn
    |> assign(:user, user)
    |> assign(:messages, messages["messages"])
    |> render(:home)
  end
end
