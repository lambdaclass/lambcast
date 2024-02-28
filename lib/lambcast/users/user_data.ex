defmodule Lambcast.Users.User_data do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_data" do


    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user_data, attrs) do
    user_data
    |> cast(attrs, [])
    |> validate_required([])
  end
end
