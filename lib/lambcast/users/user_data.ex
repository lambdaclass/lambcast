defmodule Lambcast.Users.User_data do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_data" do
    field :timestamp, :utc_datetime
    field :deleted_at, :utc_datetime
    field :fid, :integer
    field :type, :integer
    field :hash, :binary
    field :value, :string
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user_data, attrs) do
    user_data
    |> cast(attrs, [])
    |> validate_required([])
  end
end
