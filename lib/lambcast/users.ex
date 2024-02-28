defmodule Lambcast.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false
  alias Lambcast.Repo

  alias Lambcast.Users.Fname

  @doc """
  Returns the list of fnames.

  ## Examples

      iex> list_fnames()
      [%Fname{}, ...]

  """
  def list_fnames do
    Repo.all(Fname)
  end

  @doc """
  Gets a single fname.

  Raises `Ecto.NoResultsError` if the Fname does not exist.

  ## Examples

      iex> get_fname!(123)
      %Fname{}

      iex> get_fname!(456)
      ** (Ecto.NoResultsError)

  """
  def get_fname!(id), do: Repo.get!(Fname, id)

  @doc """
  Creates a fname.

  ## Examples

      iex> create_fname(%{field: value})
      {:ok, %Fname{}}

      iex> create_fname(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_fname(attrs \\ %{}) do
    %Fname{}
    |> Fname.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a fname.

  ## Examples

      iex> update_fname(fname, %{field: new_value})
      {:ok, %Fname{}}

      iex> update_fname(fname, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_fname(%Fname{} = fname, attrs) do
    fname
    |> Fname.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a fname.

  ## Examples

      iex> delete_fname(fname)
      {:ok, %Fname{}}

      iex> delete_fname(fname)
      {:error, %Ecto.Changeset{}}

  """
  def delete_fname(%Fname{} = fname) do
    Repo.delete(fname)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking fname changes.

  ## Examples

      iex> change_fname(fname)
      %Ecto.Changeset{data: %Fname{}}

  """
  def change_fname(%Fname{} = fname, attrs \\ %{}) do
    Fname.changeset(fname, attrs)
  end

  alias Lambcast.Users.User_data

  @doc """
  Returns the list of user_data.

  ## Examples

      iex> list_user_data()
      [%User_data{}, ...]

  """
  def list_user_data do
    Repo.all(User_data)
  end

  @doc """
  Gets a single user_data.

  Raises `Ecto.NoResultsError` if the User data does not exist.

  ## Examples

      iex> get_user_data!(123)
      %User_data{}

      iex> get_user_data!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_data!(id), do: Repo.get!(User_data, id)

  @doc """
  Creates a user_data.

  ## Examples

      iex> create_user_data(%{field: value})
      {:ok, %User_data{}}

      iex> create_user_data(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_data(attrs \\ %{}) do
    %User_data{}
    |> User_data.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_data.

  ## Examples

      iex> update_user_data(user_data, %{field: new_value})
      {:ok, %User_data{}}

      iex> update_user_data(user_data, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_data(%User_data{} = user_data, attrs) do
    user_data
    |> User_data.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_data.

  ## Examples

      iex> delete_user_data(user_data)
      {:ok, %User_data{}}

      iex> delete_user_data(user_data)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_data(%User_data{} = user_data) do
    Repo.delete(user_data)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_data changes.

  ## Examples

      iex> change_user_data(user_data)
      %Ecto.Changeset{data: %User_data{}}

  """
  def change_user_data(%User_data{} = user_data, attrs \\ %{}) do
    User_data.changeset(user_data, attrs)
  end
end
