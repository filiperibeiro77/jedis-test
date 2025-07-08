import { useState } from "react";
import LoginForm from "./components/LoginForm";
import TodosPage from "./pages/TodosPage";

function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(
    !!localStorage.getItem("token")
  );

  return (
    <div>
      <h1>Todo App</h1>
      {isLoggedIn ? (
        <>
          <TodosPage />
          <button onClick={() => {
            localStorage.removeItem("token");
            setIsLoggedIn(false);
          }}>
            Logout
          </button>
        </>
      ) : (
        <LoginForm onLogin={() => setIsLoggedIn(true)} />
      )}
    </div>
  );
}

export default App;
