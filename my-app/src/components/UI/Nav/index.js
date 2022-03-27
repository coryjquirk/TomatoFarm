import React from "react";
import "./style.css";
import FarmLogo from "./logo512.png";
// https://react-popup.elazizi.com/

function Nav() {
  return (
    <nav id="farmNav" className="navbar navbar-expand-lg navbar-light bg-light">
      <button
        className="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarNav"
        aria-controls="navbarNav"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span className="navbar-toggler-icon"></span>
      </button>
      <a href="/">
        <img id="mobileLogo" src={FarmLogo} alt="farm logo" />
      </a>
      <div className="collapse navbar-collapse" id="navbarNav">
        <ul className="navbarList" id="navbar-nav">
          <li className="nav-link">
            <a href="/">
              <img
                id="desktopLogo"
                src={FarmLogo}
                alt="farm logo"
              />
            </a>
          </li>
          <li className="mainNav nav-item">
            <a className="nav-link" href="/">
              home
            </a>
          </li>
          <li className="mainNav nav-item">
            <a className="nav-link" href="/inventory">
              inventory
            </a>
          </li>
          <li className="mainNav nav-item">
            <a className="nav-link" href="/plots">
              plots
            </a>
          </li>
          <li className="mainNav nav-item">
            <a className="nav-link" href="/directory">
              directory
            </a>
          </li>
          <li className="mainNav nav-item">
            <a className="nav-link" href="/options">
              options
            </a>
          </li>
          <li className="nav-item">
            <a className="nav-link" href="/logout">
              sign out
            </a>
          </li>
          <li className="mainNav nav-item">
            <a className="nav-link" href="/usermanagement">
               user management
            </a>
          </li>
        </ul>
      </div>
    </nav>
  );
}

export default Nav;
