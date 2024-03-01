defmodule Lambcast.Users.Fname do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "fnames" do
    field :fid, :integer
    field :type, :integer
    field :username, :string

    timestamps(type: :utc_datetime, inserted_at: :created_at)
    field :registered_at, :utc_datetime
    field :deleted_at, :utc_datetime
  end

  @doc false
  def changeset(fname, attrs) do
    fname
    |> cast(attrs, [])
    |> validate_required([])
  end
end
