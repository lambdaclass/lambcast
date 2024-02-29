defmodule Lambcast.Users.Fname do
  use Ecto.Schema
  import Ecto.Changeset

  schema "fnames" do
    field :registered_at, :utc_datetime
    field :deleted_at, :utc_datetime
    field :fid, :integer
    field :type, :integer
    field :username, :string
    timestamps(type: :utc_datetime)

    belongs_to :user, Lambcast.Users.Fid
  end

  @doc false
  def changeset(fname, attrs) do
    fname
    |> cast(attrs, [])
    |> validate_required([])
  end
end
