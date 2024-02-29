defmodule Lambcast.Users.Fid do
  use Ecto.Schema
  import Ecto.Changeset

  schema "fids" do
    field :fid, :integer
    field :chain_event_id, :integer
    field :custody_address, :binary
    field :recovery_address, :binary

    field :registered_at, :utc_datetime
    timestamps(type: :utc_datetime)

    has_many :casts, Lambcast.Messages.Cast
    has_many :links, Lambcast.Messages.Link
    has_many :reactions, Lambcast.Messages.Reaction
  end

  @doc false
  def changeset(fname, attrs) do
    fname
    |> cast(attrs, [])
    |> validate_required([])
  end
end
