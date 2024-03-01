defmodule Lambcast.UsersTest do
  use Lambcast.DataCase

  alias Lambcast.Users

  test "Get fid" do
    fid = Users.get_fid!("vitalik.eth")

    assert fid == 5650
  end

  test "Get user" do
    user = Users.get_user!("vinayvasanji.eth")

    assert user == %{
             username: "vinayvasanji.eth",
             fid: 1082,
             preferred_username: "vinayvasanji",
             biography:
               "/candies prev web3 identity: everyname (acq), gitcoin passport, humanetics",
             display_name: "Vinay Vasanji",
             profile_picture: "https://i.imgur.com/7y4JRTk.jpg"
           }
  end
end
