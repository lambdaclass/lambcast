defmodule Lambcast.UsersTest do
  use Lambcast.DataCase

  alias Lambcast.Users

  test "Get fid" do
    fid = Users.get_fid!("vitalik.eth")

    assert fid == 5650
  end

  test "Get user" do
    user = Users.get_user!("a")

    IO.inspect(user)
  end
end
