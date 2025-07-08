import { useEffect, useState } from "react";
import api from "../api/api";

export default function TodosPage() {
  const [todos, setTodos] = useState([]);

  useEffect(() => {
    api.get("/todos")
      .then((res) => setTodos(res.data))
      .catch((err) => {
        console.error("Erro ao carregar todos", err);
      });
  }, []);

  return (
    <div>
      <h2>Seus Todos</h2>
      <ul>
        {todos.map(todo => (
          <li key={todo.id}>{todo.title} {todo.completed ? "✔️" : "❌"}</li>
        ))}
      </ul>
    </div>
  );
}
