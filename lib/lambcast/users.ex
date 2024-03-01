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

    data = %{
      fid: fid,
      username: username
    }

    for data <- get_user_data!(fid), into: data do
      {user_data_type_number_to_atom(data.type), data.value}
    end
  end

  defp user_data_type_number_to_atom(type_number) do
    case type_number do
      1 -> :profile_picture
      2 -> :display_name
      3 -> :biography
      5 -> :url
      6 -> :preferred_username
      _ -> :none
    end
  end
end
