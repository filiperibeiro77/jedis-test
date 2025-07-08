defmodule HiringTestBackend.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `HiringTestBackend.Todos` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        title: "some title",
        completed: true
      })
      |> HiringTestBackend.Todos.create_todo()

    todo
  end
end
