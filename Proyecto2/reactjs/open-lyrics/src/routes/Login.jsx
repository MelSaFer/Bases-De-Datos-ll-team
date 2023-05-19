import { Link, Outlet } from "react-router-dom";
import React, { useEffect } from "react";
import { firebaseProperties } from "../fb";
import Logueo from "./Logueo";
import { useNavigate } from "react-router-dom";
// import Home from "./Home";

import * as Constants from "../constants";

// import classes from "./Login.module.css";

function Login() {
  const navigate = useNavigate();
  const [usuario, setUsuario] = React.useState(null);

  useEffect(() => {
    firebaseProperties.auth().onAuthStateChanged((usuarioFirebase) => {
      console.log("you are already logged in with:", usuarioFirebase);
      setUsuario(usuarioFirebase);
    });
  }, []);

  // handles logout
  const logOut = () => {
    firebaseProperties.auth().signOut();
  };

  return (
    <>
      <Outlet />
      {logOut()}
      {usuario ? (
        navigate(Constants.homeRoute)
      ) : (
        <Logueo setUsuario={setUsuario} />
      )}
    </>
  );
}

export default Login;
