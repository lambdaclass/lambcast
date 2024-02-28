defmodule Lambcast.UsersTest do
  use Lambcast.DataCase

  alias Lambcast.Users

  describe "fnames" do
    alias Lambcast.Users.Fname

    import Lambcast.UsersFixtures

    @invalid_attrs %{}

    test "list_fnames/0 returns all fnames" do
      fname = fname_fixture()
      assert Users.list_fnames() == [fname]
    end

    test "get_fname!/1 returns the fname with given id" do
      fname = fname_fixture()
      assert Users.get_fname!(fname.id) == fname
    end

    test "create_fname/1 with valid data creates a fname" do
      valid_attrs = %{}

      assert {:ok, %Fname{} = fname} = Users.create_fname(valid_attrs)
    end

    test "create_fname/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_fname(@invalid_attrs)
    end

    test "update_fname/2 with valid data updates the fname" do
      fname = fname_fixture()
      update_attrs = %{}

      assert {:ok, %Fname{} = fname} = Users.update_fname(fname, update_attrs)
    end

    test "update_fname/2 with invalid data returns error changeset" do
      fname = fname_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_fname(fname, @invalid_attrs)
      assert fname == Users.get_fname!(fname.id)
    end

    test "delete_fname/1 deletes the fname" do
      fname = fname_fixture()
      assert {:ok, %Fname{}} = Users.delete_fname(fname)
      assert_raise Ecto.NoResultsError, fn -> Users.get_fname!(fname.id) end
    end

    test "change_fname/1 returns a fname changeset" do
      fname = fname_fixture()
      assert %Ecto.Changeset{} = Users.change_fname(fname)
    end
  end

  describe "user_data" do
    alias Lambcast.Users.User_data

    import Lambcast.UsersFixtures

    @invalid_attrs %{}

    test "list_user_data/0 returns all user_data" do
      user_data = user_data_fixture()
      assert Users.list_user_data() == [user_data]
    end

    test "get_user_data!/1 returns the user_data with given id" do
      user_data = user_data_fixture()
      assert Users.get_user_data!(user_data.id) == user_data
    end

    test "create_user_data/1 with valid data creates a user_data" do
      valid_attrs = %{}

      assert {:ok, %User_data{} = user_data} = Users.create_user_data(valid_attrs)
    end

    test "create_user_data/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_user_data(@invalid_attrs)
    end

    test "update_user_data/2 with valid data updates the user_data" do
      user_data = user_data_fixture()
      update_attrs = %{}

      assert {:ok, %User_data{} = user_data} = Users.update_user_data(user_data, update_attrs)
    end

    test "update_user_data/2 with invalid data returns error changeset" do
      user_data = user_data_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_user_data(user_data, @invalid_attrs)
      assert user_data == Users.get_user_data!(user_data.id)
    end

    test "delete_user_data/1 deletes the user_data" do
      user_data = user_data_fixture()
      assert {:ok, %User_data{}} = Users.delete_user_data(user_data)
      assert_raise Ecto.NoResultsError, fn -> Users.get_user_data!(user_data.id) end
    end

    test "change_user_data/1 returns a user_data changeset" do
      user_data = user_data_fixture()
      assert %Ecto.Changeset{} = Users.change_user_data(user_data)
    end
  end
end
