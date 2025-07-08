import axios from "axios";

const API_URL = "http://localhost:4000";

export function getProtectedData() {
  const token = localStorage.getItem("token");
  return axios.get(`${API_URL}/protected-route`, {
    headers: { Authorization: `Bearer ${token}` },
  });
}
