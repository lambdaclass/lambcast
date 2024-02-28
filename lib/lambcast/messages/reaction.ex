defmodule Lambcast.Messages.Reaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reactions" do


    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(reaction, attrs) do
    reaction
    |> cast(attrs, [])
    |> validate_required([])
  end
end
