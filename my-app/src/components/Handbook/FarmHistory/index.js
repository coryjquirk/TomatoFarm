import React from "react";
import "./style.css";
// https://fontawesome.com/how-to-use/on-the-web/using-with/react
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faBook } from "@fortawesome/free-solid-svg-icons";
import { faArrowLeft } from "@fortawesome/free-solid-svg-icons";

const FarmHistory = () => {
  return (
      <div id="farmHistory">
        <h1>It all started when...</h1>
        <p>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc neque augue, imperdiet id leo in, consequat lobortis risus. Etiam vestibulum, ex id rutrum facilisis, urna augue facilisis diam, eu imperdiet massa turpis non nunc. Mauris eget nisl a lacus gravida rhoncus sit amet a quam. Nunc interdum mi sit amet ipsum tincidunt ultrices. Vivamus dapibus vel nisi ac lobortis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent diam tellus, molestie sit amet quam et, cursus condimentum diam. Suspendisse gravida venenatis aliquam. Proin ac laoreet lectus. Aliquam erat volutpat. Phasellus vestibulum lorem ac pulvinar blandit. Phasellus placerat luctus lectus, id faucibus dui volutpat ut.
        </p>
        <p>
        Curabitur lobortis sapien nec mattis accumsan. Cras arcu ligula, dictum vitae porta sodales, consectetur quis est. Vestibulum varius pulvinar turpis, non vehicula metus tempor eget. Duis fringilla euismod semper. Ut id erat dapibus, efficitur justo ac, molestie nibh. Quisque felis libero, condimentum ac lacus quis, vehicula dignissim dolor. Praesent a purus pretium, volutpat lectus vitae, congue augue. Phasellus eu purus nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ac tincidunt nulla, vitae blandit libero. Fusce aliquet tincidunt lacus eu consectetur.
        </p>
        <p>
          The farm now sits within this public park and is a 501(c)(3)
          non-profit organization.
        </p>
        <p id="externalLink">
          Source:{" "}
          <a href="https://en.wikipedia.org/wiki/Urban_agriculture">
            Farm website
          </a>
        </p>
        <p id="subText">
          <a href="/handbook">
            <FontAwesomeIcon
              id="goinHome"
              icon={faArrowLeft}
              className="fas fa-book"
            />{" "}
            Back to Employee Handbook{" "}
            <FontAwesomeIcon id="goinHome" icon={faBook} className="fas fa-book" />
          </a>
        </p>
        <div className="mapouter">
          <div className="gmap_canvas">
            <iframe
              title="farm map"
              width="646"
              height="491"
              id="gmap_canvas"
              src="https://maps.google.com/maps?q=941%20Lafond%20Ave,%20St%20Paul,%20MN%2055104&t=&z=17&ie=UTF8&iwloc=&output=embed"
              frameBorder="0"
              scrolling="no"
              marginheight="0"
              marginwidth="0"
            ></iframe>
          </div>
        </div>
      </div>
  );
};

export default FarmHistory;
