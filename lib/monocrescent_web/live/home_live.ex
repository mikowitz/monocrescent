defmodule MonocrescentWeb.HomeLive do
  use MonocrescentWeb, :live_view

  alias Monocrescent.Contacts
  alias Monocrescent.Contacts.Email

  def mount(_, _, socket) do
    socket =
      socket
      |> assign_new_changeset()

    {:ok, socket}
  end

  def handle_event("validate", %{"email" => email_params}, socket) do
    changeset =
      %Email{}
      |> Contacts.change_email(email_params)
      |> Map.put(:action, :insert)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("submit-email", %{"email" => email_params}, socket) do
    case Contacts.create_email(email_params) do
      {:ok, %Email{}} ->
        socket =
          socket
          |> put_flash(:info, "Your email has been submitted. Thank you!")
          |> assign_new_changeset()

        {:noreply, socket}

      {_error, %Ecto.Changeset{} = changeset} ->
        socket =
          socket
          |> put_flash(:error, "Please provide a valid email address and name below.")
          |> assign(changeset: changeset)

        {:noreply, socket}
    end
  end

  defp assign_new_changeset(socket) do
    assign(socket, changeset: Contacts.change_email(%Email{}))
  end
end
