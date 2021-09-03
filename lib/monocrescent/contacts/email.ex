defmodule Monocrescent.Contacts.Email do
  use Ecto.Schema
  import Ecto.Changeset

  schema "emails" do
    field :email_address, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(email, attrs) do
    email
    |> cast(attrs, [:email_address, :name])
    |> validate_required([:email_address, :name])
    |> validate_format(:email_address, ~r/^[^\s]+@[^\s]+$/,
      message: "must be a valid email address"
    )
  end
end
