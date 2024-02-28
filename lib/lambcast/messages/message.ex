defmodule Lambcast.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do


    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [])
    |> validate_required([])
  end
end
