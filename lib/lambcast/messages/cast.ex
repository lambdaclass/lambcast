defmodule Lambcast.Messages.Cast do
  use Ecto.Schema
  import Ecto.Changeset

  schema "casts" do
    field :timestamp, :utc_datetime
    field :deleted_at, :utc_datetime
    field :fid, :integer
    field :parent_fid, :integer
    field :hash, :binary
    field :root_parent_hash, :binary
    field :parent_hash, :binary
    field :root_parent_url, :string
    field :parent_url, :string
    field :text, :string
    field :embeds, Ecto.JSON
    field :mentions, Ecto.JSON
    field :mentions_positions, Ecto.JSON
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(cast, attrs) do
    cast
    |> cast(attrs, [])
    |> validate_required([])
  end
end
