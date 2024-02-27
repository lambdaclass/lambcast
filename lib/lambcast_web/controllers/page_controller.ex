defmodule LambcastWeb.PageController do
  use LambcastWeb, :controller
  alias Farcaster.Rpc

  def home(conn, _params) do
    user =
      Rpc.get_request("userNameProofByName?name=vitalik.eth")

    messages = Rpc.get_request("castsByFid?fid=#{user["fid"]}" <> "&reverse=1")

    conn
    |> assign(:user, user)
    |> assign(:messages, messages["messages"])
    |> render(:home)
  end

  def test() do
    messages = Rpc.get_request("castsByFid?fid=#{5650}" <> "&reverse=1")

    for msg <- messages["messages"] do
      if !msg["data"]["castAddBody"]["parentCastId"]["fid"] do
        interactions =
          Farcaster.Rpc.get_request(
            "reactionsByCast?target_fid=#{5650}" <>
              "&target_hash=#{msg["hash"]}" <> "&reaction_type=1"
          )

        # Not efficient
        # IO.puts(Enum.count(interactions["messages"]))
        IO.puts(msg["data"]["castAddBody"]["text"])
      end
    end
  end
end
