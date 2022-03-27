import React, { useState, useEffect } from "react";
import "./style.css";
//later on, this component will be launcher buttons for sub-directories (staff, volunteer, board, etc)

function Directory() {
  const [loading, setLoading] = useState(true);
  useEffect(() => {
    setTimeout(() => setLoading(false), 1000);
  }, []);
  return (
    <div>
      {loading === false ? (
        <p>Coming soon, gloriously!</p>
      ) : (
        <img
          id="loadingScrn"
          src="https://i.imgur.com/ZljUeZh.gif"
          alt="loadingscreen"
        ></img>
      )}
    </div>
  );
}

export default Directory;
