import React from "react"
import PropTypes from "prop-types"

import logoimg from './ml.png'

function Intro(props) {
  function Continue(e){
    e.preventDefault()
    props.nextStep()
  }
  return (
    <React.Fragment>
      <div className="feedback-header">
        <h1>Padėkite mums tobulinti paslaugų kokybę.</h1>
        <h2>Atsakykite į kelis klausimus - užtruksite 1 minutę.</h2>
      </div>
      <div className="navigation">
        <a onClick={Continue} className="next-button">Tęsti</a>
      </div>
    </React.Fragment>

  );
}

Intro.propTypes = {
  nextStep: PropTypes.func
}


export default Intro
