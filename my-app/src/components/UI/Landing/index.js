import React from "react";
import "./style.css";
import Texture from "../../../assets/45-degree-fabric-light.png";
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
// https://fontawesome.com/how-to-use/on-the-web/using-with/react
import {faCog} from "@fortawesome/free-solid-svg-icons";

const cardStyle = {
    backgroundImage: `url(${Texture})`,
    maxWidth: "400px",
};

function Landing() {
    return (
        <div id="homeLauncherList">
            <a href="/inventory">
                <div className="homeLauncher" style={cardStyle}>
                    <h3>
                        <span>Farm Inventory</span>
                    </h3>
                </div>
            </a>
            <a href="/directory">
                <div className="homeLauncher" style={cardStyle}>
                    <h3>
                        <span>Directory</span>
                    </h3>
                </div>
            </a>
            <a href="/plots">
                <div className="homeLauncher" style={cardStyle}>
                    <h3>
                        <span>Plots</span>
                    </h3>
                </div>
            </a>
            <a href="/options">
                <div className="homeLauncher" style={cardStyle}>
                    <h3>
            <span>Options{" "}<FontAwesomeIcon
                id="goinHome"
                icon={faCog}
                className="fas fa-home"
            /></span>
                    </h3>
                </div>
            </a>
            <a href="/logout">
                <div className="homeLauncher" style={cardStyle}>
                    <h3 className="text-muted">
                        <span>Sign Out</span>
                    </h3>
                </div>
            </a>
            <a href="/usermanagement">
                <div className="homeLauncher" style={cardStyle}>
                    <h3>
            <span>User Management
            </span>
                    </h3>
                </div>
            </a>
        </div>
    );
}

export default Landing;
