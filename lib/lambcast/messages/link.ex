defmodule Lambcast.Messages.Link do
  use Ecto.Schema
  import Ecto.Changeset

  schema "links" do
    field :timestamp, :utc_datetime
    field :deleted_at, :utc_datetime
    field :fid, :integer
    field :target_fid, :integer
    field :display_timestamp, :utc_datetime
    field :type, :string
    field :hash, :binary
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [])
    |> validate_required([])
  end
end
