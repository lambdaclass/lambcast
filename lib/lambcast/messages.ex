defmodule Lambcast.Messages do
  @moduledoc """
  The Messages context.
  """

  import Ecto.Query, warn: false
  #alias Lambcast.Repo
  #alias Lambcast.Messages.Cast

  @doc """
  Gets casts by fid.

  Raises `Ecto.NoResultsError` if the fid does not exist.

  ## Examples


      iex> get_casts!(123)
      %Message{}

      iex> get_casts!(456)
      ** (Ecto.NoResultsError)

  """
  def get_casts!(_fid) do
    [
      %{timestamp: "Jan 15, 2024 13:45", text: "This is my first cast!"},
      %{timestamp: "Jan 15, 2024 13:46", text: "This is my second cast!"},
      %{timestamp: "Jan 15, 2024 13:47", text: "This is my third cast!"}
    ]
  end

end
