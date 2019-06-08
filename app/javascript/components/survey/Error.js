import React from "react"


function Error() {
  return (
    <>
      <div className="feedback-header">
        <h1>Apklausa neaktyvi</h1>
        <h2>Jūs jau sudalyvavote apklausoje arba ji buvo išjungta sistemos administratoriaus.</h2>
      </div>
      <div className="navigation error-page">
        <a href="#" className="next-button">Grįžti į pagrindinį puslapį</a>
      </div>
    </>
  );
}


export default Error

