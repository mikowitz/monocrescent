defmodule Monocrescent.ContactsTest do
  use Monocrescent.DataCase

  alias Monocrescent.Contacts

  describe "emails" do
    alias Monocrescent.Contacts.Email

    @valid_attrs %{email_address: "some email_address", name: "some name"}
    @update_attrs %{email_address: "some updated email_address", name: "some updated name"}
    @invalid_attrs %{email_address: nil, name: nil}

    def email_fixture(attrs \\ %{}) do
      {:ok, email} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Contacts.create_email()

      email
    end

    test "list_emails/0 returns all emails" do
      email = email_fixture()
      assert Contacts.list_emails() == [email]
    end

    test "get_email!/1 returns the email with given id" do
      email = email_fixture()
      assert Contacts.get_email!(email.id) == email
    end

    test "create_email/1 with valid data creates a email" do
      assert {:ok, %Email{} = email} = Contacts.create_email(@valid_attrs)
      assert email.email_address == "some email_address"
      assert email.name == "some name"
    end

    test "create_email/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contacts.create_email(@invalid_attrs)
    end

    test "update_email/2 with valid data updates the email" do
      email = email_fixture()
      assert {:ok, %Email{} = email} = Contacts.update_email(email, @update_attrs)
      assert email.email_address == "some updated email_address"
      assert email.name == "some updated name"
    end

    test "update_email/2 with invalid data returns error changeset" do
      email = email_fixture()
      assert {:error, %Ecto.Changeset{}} = Contacts.update_email(email, @invalid_attrs)
      assert email == Contacts.get_email!(email.id)
    end

    test "delete_email/1 deletes the email" do
      email = email_fixture()
      assert {:ok, %Email{}} = Contacts.delete_email(email)
      assert_raise Ecto.NoResultsError, fn -> Contacts.get_email!(email.id) end
    end

    test "change_email/1 returns a email changeset" do
      email = email_fixture()
      assert %Ecto.Changeset{} = Contacts.change_email(email)
    end
  end
end
