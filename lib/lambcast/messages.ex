defmodule Lambcast.Messages do
  @moduledoc """
  The Messages context.
  """

  import Ecto.Query, warn: false

  @doc """
  Gets casts by fid.

  Raises `Ecto.NoResultsError` if the fid does not exist.

  ## Examples


      iex> get_casts!(123)
      %Message{}

      iex> get_casts!(456)
      ** (Ecto.NoResultsError)

  """

  # def get_casts!(_fid) do
  #  [
  #    %{timestamp: "Jan 15, 2024 13:45", text: "This is my first cast!"},
  #    %{timestamp: "Jan 15, 2024 13:46", text: "This is my second cast!"},
  #    %{timestamp: "Jan 15, 2024 13:47", text: "This is my third cast!"}
  #  ]
  # end
  alias Lambcast.Repo

  def get_casts!(fid) do
    Repo.all(
      from c in "casts",
        where: c.fid == ^fid and is_nil(c.deleted_at),
        order_by: [desc: :timestamp],
        select: [:text, :hash],
        limit: 10
    )
  end

  def get_cast_likes!(cast_hash) do
    Repo.all(
      from r in "reactions",
        where: r.target_cast_hash == ^cast_hash,
        select: count(1)
    )
  end
end