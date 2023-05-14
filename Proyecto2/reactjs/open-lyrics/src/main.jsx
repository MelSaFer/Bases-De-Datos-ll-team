import React from "react";
import ReactDOM from "react-dom/client";
import { RouterProvider, createBrowserRouter } from "react-router-dom";

import Login from "./routes/Login.jsx";
import LoginBg from "./components/LoginBackground.jsx";
import "./index.css";

const router = createBrowserRouter([
  {
    path: "/",
    element: <LoginBg />,
    children: [
      {
        path: "/",
        element: <Login />,
      },
    ],
  },
]);

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
