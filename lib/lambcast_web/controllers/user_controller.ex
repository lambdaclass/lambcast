defmodule LambcastWeb.UserController do
  use LambcastWeb, :controller
  alias Farcaster.Rpc

  def index(conn, %{"user" => user}) do
    case Rpc.get_request("userNameProofByName?name=#{user}") do
      %{"errCode" => code} ->
        conn
        |> put_flash(:error, "Error: #{code}")
        |> redirect(to: "/")
      %{"fid" => fid} ->
        %{"data" => %{"userDataBody" => %{"value" => name}}} = Rpc.get_request("userDataByFid?fid=#{fid}&user_data_type=USER_DATA_TYPE_DISPLAY")
        %{"data" => %{"userDataBody" => %{"value" => bio}}} = Rpc.get_request("userDataByFid?fid=#{fid}&user_data_type=USER_DATA_TYPE_BIO")
        %{"data" => %{"userDataBody" => %{"value" => picture}}} = Rpc.get_request("userDataByFid?fid=#{fid}&user_data_type=USER_DATA_TYPE_PFP")
        messages = Rpc.get_request("castsByFid?fid=#{fid}" <> "&reverse=1")

        conn
        |> assign(:user, user)
        |> assign(:fid, fid)
        |> assign(:name, name)
        |> assign(:bio, bio)
        |> assign(:picture, picture)
        |> assign(:messages, messages["messages"])
        |> render(:index)
    end
  end
end
