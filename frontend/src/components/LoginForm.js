import React, { useState } from "react";
import axios from "axios";

function LoginForm({ onLoginSuccess }) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState(null);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError(null); // limpa erro ao tentar login de novo
    try {
      const response = await axios.post("http://localhost:4000/api/login", { email, password });
      const token = response.data.token;
      localStorage.setItem("token", token);  // salva o token no storage
      onLoginSuccess();                      // avisa o pai que login funcionou
    } catch (err) {
      setError("Login falhou, tente novamente.");
      console.error(err);
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <input
        type="email"
        placeholder="E-mail"
        value={email}
        onChange={(e) => setEmail(e.target.value)}
        required
      />
      <input
        type="password"
        placeholder="Senha"
        value={password}
        onChange={(e) => setPassword(e.target.value)}
        required
      />
      <button type="submit">Entrar</button>

      {error && <p style={{ color: "red" }}>{error}</p>}
    </form>
  );
}

export default LoginForm;
