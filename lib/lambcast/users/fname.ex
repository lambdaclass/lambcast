defmodule Lambcast.Users.Fname do
  use Ecto.Schema
  import Ecto.Changeset

  schema "fnames" do


    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(fname, attrs) do
    fname
    |> cast(attrs, [])
    |> validate_required([])
  end
end
