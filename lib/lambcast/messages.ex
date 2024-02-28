defmodule Lambcast.Messages do
  @moduledoc """
  The Messages context.
  """

  import Ecto.Query, warn: false
  alias Lambcast.Repo

  alias Lambcast.Messages.Message

  @doc """
  Returns the list of messages.

  ## Examples

      iex> list_messages()
      [%Message{}, ...]

  """
  def list_messages do
    Repo.all(Message)
  end

  @doc """
  Gets a single message.

  Raises `Ecto.NoResultsError` if the Message does not exist.

  ## Examples

      iex> get_message!(123)
      %Message{}

      iex> get_message!(456)
      ** (Ecto.NoResultsError)

  """
  def get_message!(id), do: Repo.get!(Message, id)

  @doc """
  Creates a message.

  ## Examples

      iex> create_message(%{field: value})
      {:ok, %Message{}}

      iex> create_message(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_message(attrs \\ %{}) do
    %Message{}
    |> Message.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a message.

  ## Examples

      iex> update_message(message, %{field: new_value})
      {:ok, %Message{}}

      iex> update_message(message, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_message(%Message{} = message, attrs) do
    message
    |> Message.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a message.

  ## Examples

      iex> delete_message(message)
      {:ok, %Message{}}

      iex> delete_message(message)
      {:error, %Ecto.Changeset{}}

  """
  def delete_message(%Message{} = message) do
    Repo.delete(message)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking message changes.

  ## Examples

      iex> change_message(message)
      %Ecto.Changeset{data: %Message{}}

  """
  def change_message(%Message{} = message, attrs \\ %{}) do
    Message.changeset(message, attrs)
  end

  alias Lambcast.Messages.Cast

  @doc """
  Returns the list of casts.

  ## Examples

      iex> list_casts()
      [%Cast{}, ...]

  """
  def list_casts do
    Repo.all(Cast)
  end

  @doc """
  Gets a single cast.

  Raises `Ecto.NoResultsError` if the Cast does not exist.

  ## Examples

      iex> get_cast!(123)
      %Cast{}

      iex> get_cast!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cast!(id), do: Repo.get!(Cast, id)

  @doc """
  Creates a cast.

  ## Examples

      iex> create_cast(%{field: value})
      {:ok, %Cast{}}

      iex> create_cast(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cast(attrs \\ %{}) do
    %Cast{}
    |> Cast.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cast.

  ## Examples

      iex> update_cast(cast, %{field: new_value})
      {:ok, %Cast{}}

      iex> update_cast(cast, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cast(%Cast{} = cast, attrs) do
    cast
    |> Cast.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a cast.

  ## Examples

      iex> delete_cast(cast)
      {:ok, %Cast{}}

      iex> delete_cast(cast)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cast(%Cast{} = cast) do
    Repo.delete(cast)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cast changes.

  ## Examples

      iex> change_cast(cast)
      %Ecto.Changeset{data: %Cast{}}

  """
  def change_cast(%Cast{} = cast, attrs \\ %{}) do
    Cast.changeset(cast, attrs)
  end

  alias Lambcast.Messages.Link

  @doc """
  Returns the list of links.

  ## Examples

      iex> list_links()
      [%Link{}, ...]

  """
  def list_links do
    Repo.all(Link)
  end

  @doc """
  Gets a single link.

  Raises `Ecto.NoResultsError` if the Link does not exist.

  ## Examples

      iex> get_link!(123)
      %Link{}

      iex> get_link!(456)
      ** (Ecto.NoResultsError)

  """
  def get_link!(id), do: Repo.get!(Link, id)

  @doc """
  Creates a link.

  ## Examples

      iex> create_link(%{field: value})
      {:ok, %Link{}}

      iex> create_link(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_link(attrs \\ %{}) do
    %Link{}
    |> Link.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a link.

  ## Examples

      iex> update_link(link, %{field: new_value})
      {:ok, %Link{}}

      iex> update_link(link, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_link(%Link{} = link, attrs) do
    link
    |> Link.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a link.

  ## Examples

      iex> delete_link(link)
      {:ok, %Link{}}

      iex> delete_link(link)
      {:error, %Ecto.Changeset{}}

  """
  def delete_link(%Link{} = link) do
    Repo.delete(link)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking link changes.

  ## Examples

      iex> change_link(link)
      %Ecto.Changeset{data: %Link{}}

  """
  def change_link(%Link{} = link, attrs \\ %{}) do
    Link.changeset(link, attrs)
  end

  alias Lambcast.Messages.Reaction

  @doc """
  Returns the list of reactions.

  ## Examples

      iex> list_reactions()
      [%Reaction{}, ...]

  """
  def list_reactions do
    Repo.all(Reaction)
  end

  @doc """
  Gets a single reaction.

  Raises `Ecto.NoResultsError` if the Reaction does not exist.

  ## Examples

      iex> get_reaction!(123)
      %Reaction{}

      iex> get_reaction!(456)
      ** (Ecto.NoResultsError)

  """
  def get_reaction!(id), do: Repo.get!(Reaction, id)

  @doc """
  Creates a reaction.

  ## Examples

      iex> create_reaction(%{field: value})
      {:ok, %Reaction{}}

      iex> create_reaction(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_reaction(attrs \\ %{}) do
    %Reaction{}
    |> Reaction.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a reaction.

  ## Examples

      iex> update_reaction(reaction, %{field: new_value})
      {:ok, %Reaction{}}

      iex> update_reaction(reaction, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_reaction(%Reaction{} = reaction, attrs) do
    reaction
    |> Reaction.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a reaction.

  ## Examples

      iex> delete_reaction(reaction)
      {:ok, %Reaction{}}

      iex> delete_reaction(reaction)
      {:error, %Ecto.Changeset{}}

  """
  def delete_reaction(%Reaction{} = reaction) do
    Repo.delete(reaction)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking reaction changes.

  ## Examples

      iex> change_reaction(reaction)
      %Ecto.Changeset{data: %Reaction{}}

  """
  def change_reaction(%Reaction{} = reaction, attrs \\ %{}) do
    Reaction.changeset(reaction, attrs)
  end
end
