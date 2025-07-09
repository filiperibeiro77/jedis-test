defmodule HiringTestBackend.Todos.Todo do
  use Ecto.Schema
  import Ecto.Changeset
  alias HiringTestBackend.Accounts.User

  @primary_key {:id, :binary_id, autogenerate: true} # <-- aqui
  @derive {Phoenix.Param, key: :id}

  schema "todos" do
    field :title, :string
    field :completed, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:title, :completed])
    |> validate_required([:title])
    |> unique_constraint(:title)
  end
end
