defmodule Lambcast.Messages.Reaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reactions" do
    field :timestamp, :utc_datetime
    field :deleted_at, :utc_datetime
    field :fid, :integer
    field :target_cast_fid, :integer
    field :type, :integer
    field :hash, :binary
    field :target_cast_hash, :binary
    field :target_url, :string

    belongs_to :user, Lambcast.Users.User
    belongs_to :cast, Lambcast.Messages.Cast
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(reaction, attrs) do
    reaction
    |> cast(attrs, [])
    |> validate_required([])
  end
end
