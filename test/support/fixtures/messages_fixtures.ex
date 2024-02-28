defmodule Lambcast.MessagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Lambcast.Messages` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{

      })
      |> Lambcast.Messages.create_message()

    message
  end

  @doc """
  Generate a cast.
  """
  def cast_fixture(attrs \\ %{}) do
    {:ok, cast} =
      attrs
      |> Enum.into(%{

      })
      |> Lambcast.Messages.create_cast()

    cast
  end

  @doc """
  Generate a link.
  """
  def link_fixture(attrs \\ %{}) do
    {:ok, link} =
      attrs
      |> Enum.into(%{

      })
      |> Lambcast.Messages.create_link()

    link
  end

  @doc """
  Generate a reaction.
  """
  def reaction_fixture(attrs \\ %{}) do
    {:ok, reaction} =
      attrs
      |> Enum.into(%{

      })
      |> Lambcast.Messages.create_reaction()

    reaction
  end
end
