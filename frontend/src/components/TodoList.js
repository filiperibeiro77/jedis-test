import React, { useEffect, useState } from 'react';
import axios from 'axios';

const API_URL = 'http://localhost:4000/api/todos';

export default function TodoList() {
  const [todos, setTodos] = useState([]);
  const [title, setTitle] = useState('');

  // Carrega todos ao iniciar
  useEffect(() => {
    fetchTodos();
  }, []);

  const fetchTodos = async () => {
    const res = await axios.get(API_URL);
    setTodos(res.data.data);
  };

  const createTodo = async () => {
    if (title.trim() === '') return;
    await axios.post(API_URL, { todo: { title, completed: false } });
    setTitle('');
    fetchTodos();
  };

  const toggleCompleted = async (todo) => {
    await axios.put(`${API_URL}/${todo.id}`, {
      todo: { ...todo, completed: !todo.completed }
    });
    fetchTodos();
  };

  const deleteTodo = async (id) => {
    await axios.delete(`${API_URL}/${id}`);
    fetchTodos();
  };

  return (
    <div>
      <h1>To-Do List</h1>

      <input
        type="text"
        placeholder="Nova tarefa"
        value={title}
        onChange={(e) => setTitle(e.target.value)}
      />
      <button onClick={createTodo}>Adicionar</button>

      <ul>
        {todos.map((todo) => (
          <li key={todo.id}>
            <span
              style={{
                textDecoration: todo.completed ? 'line-through' : 'none',
                cursor: 'pointer'
              }}
              onClick={() => toggleCompleted(todo)}
            >
              {todo.title}
            </span>
            <button onClick={() => deleteTodo(todo.id)}>Excluir</button>
          </li>
        ))}
      </ul>
    </div>
  );
}
