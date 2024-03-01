defmodule Lambcast.Users.User_data do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "user_data" do
    field :fid, :integer
    field :type, :integer
    field :hash, :binary
    field :value, :string

    timestamps(type: :utc_datetime, inserted_at: :created_at)
    field :timestamp, :utc_datetime
    field :deleted_at, :utc_datetime

    # belongs_to :user, Lambcast.Users.Fid
  end

  @doc false
  def changeset(user_data, attrs) do
    user_data
    |> cast(attrs, [])
    |> validate_required([])
  end
end
