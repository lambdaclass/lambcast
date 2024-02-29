defmodule Lambcast.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :timestamp, :utc_datetime
    field :deleted_at, :utc_datetime
    field :pruned_at, :utc_datetime
    field :revoked_at, :utc_datetime
    field :fid, :integer
    field :type, :integer
    field :hash_scheme, :integer
    field :signature_scheme, :integer
    field :hash, :binary
    field :signature, :binary
    field :signer, :binary
    field :raw, :binary
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [])
    |> validate_required([])
  end
end
