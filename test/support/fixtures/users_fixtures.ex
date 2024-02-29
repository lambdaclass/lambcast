defmodule Lambcast.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Lambcast.Users` context.
  """

  @doc """
  Generate a fname.
  """
  def fname_fixture(attrs \\ %{}) do
    {:ok, fname} =
      attrs
      |> Enum.into(%{})
      |> Lambcast.Users.create_fname()

    fname
  end

  @doc """
  Generate a user_data.
  """
  def user_data_fixture(attrs \\ %{}) do
    {:ok, user_data} =
      attrs
      |> Enum.into(%{})
      |> Lambcast.Users.create_user_data()

    user_data
  end
end
