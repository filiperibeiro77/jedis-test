import React, { useEffect, useState } from "react";
import axios from "axios";
import TodoList from "../components/TodoList";

function TodosPage() {
  const [todos, setTodos] = useState([]);

  useEffect(() => {
    const fetchTodos = async () => {
      const token = localStorage.getItem("token");
      try {
        const response = await axios.get("/api/todos", {
          headers: { Authorization: `Bearer ${token}` },
        });
        setTodos(response.data);
      } catch (error) {
        console.error("Erro ao buscar todos:", error);
      }
    };

    fetchTodos();
  }, []);

  return (
    <div>
      <h1>Lista de Tarefas</h1>
      <TodoList todos={todos} />
    </div>
  );
}

export default TodosPage;
