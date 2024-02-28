defmodule Lambcast.MessagesTest do
  use Lambcast.DataCase

  alias Lambcast.Messages

  describe "messages" do
    alias Lambcast.Messages.Message

    import Lambcast.MessagesFixtures

    @invalid_attrs %{}

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Messages.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Messages.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      valid_attrs = %{}

      assert {:ok, %Message{} = message} = Messages.create_message(valid_attrs)
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messages.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      update_attrs = %{}

      assert {:ok, %Message{} = message} = Messages.update_message(message, update_attrs)
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Messages.update_message(message, @invalid_attrs)
      assert message == Messages.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Messages.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Messages.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Messages.change_message(message)
    end
  end

  describe "casts" do
    alias Lambcast.Messages.Cast

    import Lambcast.MessagesFixtures

    @invalid_attrs %{}

    test "list_casts/0 returns all casts" do
      cast = cast_fixture()
      assert Messages.list_casts() == [cast]
    end

    test "get_cast!/1 returns the cast with given id" do
      cast = cast_fixture()
      assert Messages.get_cast!(cast.id) == cast
    end

    test "create_cast/1 with valid data creates a cast" do
      valid_attrs = %{}

      assert {:ok, %Cast{} = cast} = Messages.create_cast(valid_attrs)
    end

    test "create_cast/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messages.create_cast(@invalid_attrs)
    end

    test "update_cast/2 with valid data updates the cast" do
      cast = cast_fixture()
      update_attrs = %{}

      assert {:ok, %Cast{} = cast} = Messages.update_cast(cast, update_attrs)
    end

    test "update_cast/2 with invalid data returns error changeset" do
      cast = cast_fixture()
      assert {:error, %Ecto.Changeset{}} = Messages.update_cast(cast, @invalid_attrs)
      assert cast == Messages.get_cast!(cast.id)
    end

    test "delete_cast/1 deletes the cast" do
      cast = cast_fixture()
      assert {:ok, %Cast{}} = Messages.delete_cast(cast)
      assert_raise Ecto.NoResultsError, fn -> Messages.get_cast!(cast.id) end
    end

    test "change_cast/1 returns a cast changeset" do
      cast = cast_fixture()
      assert %Ecto.Changeset{} = Messages.change_cast(cast)
    end
  end

  describe "links" do
    alias Lambcast.Messages.Link

    import Lambcast.MessagesFixtures

    @invalid_attrs %{}

    test "list_links/0 returns all links" do
      link = link_fixture()
      assert Messages.list_links() == [link]
    end

    test "get_link!/1 returns the link with given id" do
      link = link_fixture()
      assert Messages.get_link!(link.id) == link
    end

    test "create_link/1 with valid data creates a link" do
      valid_attrs = %{}

      assert {:ok, %Link{} = link} = Messages.create_link(valid_attrs)
    end

    test "create_link/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messages.create_link(@invalid_attrs)
    end

    test "update_link/2 with valid data updates the link" do
      link = link_fixture()
      update_attrs = %{}

      assert {:ok, %Link{} = link} = Messages.update_link(link, update_attrs)
    end

    test "update_link/2 with invalid data returns error changeset" do
      link = link_fixture()
      assert {:error, %Ecto.Changeset{}} = Messages.update_link(link, @invalid_attrs)
      assert link == Messages.get_link!(link.id)
    end

    test "delete_link/1 deletes the link" do
      link = link_fixture()
      assert {:ok, %Link{}} = Messages.delete_link(link)
      assert_raise Ecto.NoResultsError, fn -> Messages.get_link!(link.id) end
    end

    test "change_link/1 returns a link changeset" do
      link = link_fixture()
      assert %Ecto.Changeset{} = Messages.change_link(link)
    end
  end

  describe "reactions" do
    alias Lambcast.Messages.Reaction

    import Lambcast.MessagesFixtures

    @invalid_attrs %{}

    test "list_reactions/0 returns all reactions" do
      reaction = reaction_fixture()
      assert Messages.list_reactions() == [reaction]
    end

    test "get_reaction!/1 returns the reaction with given id" do
      reaction = reaction_fixture()
      assert Messages.get_reaction!(reaction.id) == reaction
    end

    test "create_reaction/1 with valid data creates a reaction" do
      valid_attrs = %{}

      assert {:ok, %Reaction{} = reaction} = Messages.create_reaction(valid_attrs)
    end

    test "create_reaction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messages.create_reaction(@invalid_attrs)
    end

    test "update_reaction/2 with valid data updates the reaction" do
      reaction = reaction_fixture()
      update_attrs = %{}

      assert {:ok, %Reaction{} = reaction} = Messages.update_reaction(reaction, update_attrs)
    end

    test "update_reaction/2 with invalid data returns error changeset" do
      reaction = reaction_fixture()
      assert {:error, %Ecto.Changeset{}} = Messages.update_reaction(reaction, @invalid_attrs)
      assert reaction == Messages.get_reaction!(reaction.id)
    end

    test "delete_reaction/1 deletes the reaction" do
      reaction = reaction_fixture()
      assert {:ok, %Reaction{}} = Messages.delete_reaction(reaction)
      assert_raise Ecto.NoResultsError, fn -> Messages.get_reaction!(reaction.id) end
    end

    test "change_reaction/1 returns a reaction changeset" do
      reaction = reaction_fixture()
      assert %Ecto.Changeset{} = Messages.change_reaction(reaction)
    end
  end
end
