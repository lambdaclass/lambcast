defmodule Lambcast.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false

  def get_user!(username) do
    %{
      fid: 1234,
      username: username,
      displayname: "displayname",
      bio: "A very short biography",
      picture: "https://i.imgur.com/YcP0tik.jpeg"
    }
  end
end
