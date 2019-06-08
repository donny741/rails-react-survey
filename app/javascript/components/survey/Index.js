import React from "react"
import PropTypes from "prop-types"

import Router from './Router'

function Index(props) {
  console.log("here")
  return (
      <div className="wrapper">
        <div className="feedback">
          <div className="logo">
            <span>Logo</span>
            <span>Apklausa</span>
          </div>
          <Router questions = {props.questions} success_url = {props.success_url} ekey={props.ekey}/>
        </div>
      </div>
  );

}

Index.propTypes = {
  questions: PropTypes.array,
  success_url: PropTypes.string,
  ekey: PropTypes.string
}

export default Index
