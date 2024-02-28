defmodule Lambcast.Messages.Cast do
  use Ecto.Schema
  import Ecto.Changeset

  schema "casts" do


    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(cast, attrs) do
    cast
    |> cast(attrs, [])
    |> validate_required([])
  end
end
