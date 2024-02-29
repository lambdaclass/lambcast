defmodule Lambcast.Messages.Cast do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: false}
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

    timestamps(type: :utc_datetime, inserted_at: :created_at)

    has_many :reactions, Lambcast.Messages.Reaction
    # belongs_to :fid, Lambcast.Users.Fid, foreign_key:
  end

  @doc false
  def changeset(cast, attrs) do
    cast
    |> cast(attrs, [])
    |> validate_required([])
  end
end
