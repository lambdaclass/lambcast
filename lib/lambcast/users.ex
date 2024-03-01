defmodule Lambcast.Users do
  @moduledoc """
  The Users context.
  """

  alias Lambcast.Repo

  # alias Lambcast.Users.Fid
  alias Lambcast.Users.Fname
  alias Lambcast.Users.User_data

  import Ecto.Query, warn: false

  def get_fid!(username) do
    Repo.get_by!(Fname, username: username).fid
  end

  def get_user_data!(fid) do
    Repo.all(
      from user_data in User_data,
        where: user_data.fid == ^fid
    )
  end

  def get_user!(username) do
    fid = get_fid!(username)

    data = get_user_data!(fid)

    %{
      username: username,
      fid: fid,
      data: data
    }
  end
end
