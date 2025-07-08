import React, { useState } from "react";
import LoginForm from "./components/LoginForm";
import TodoList from "./components/TodoList";

function App() {
  const [loggedIn, setLoggedIn] = useState(!!localStorage.getItem("token"));

  const handleLoginSuccess = () => {
    setLoggedIn(true);
  };

  return (
    <div>
      {loggedIn ? (
        <TodoList />
      ) : (
        <LoginForm onLoginSuccess={handleLoginSuccess} />
      )}
    </div>
  );
}

export default App;
