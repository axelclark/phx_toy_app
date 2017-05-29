defmodule PhxToyApp.AcMicroposts.Micropost do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhxToyApp.AcMicroposts.Micropost


  schema "ac_microposts_microposts" do
    field :content, :string
    belongs_to :user, PhxToyApp.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Micropost{} = micropost, attrs) do
    micropost
    |> cast(attrs, [:content, :user_id])
    |> validate_required([:content])
  end
end
