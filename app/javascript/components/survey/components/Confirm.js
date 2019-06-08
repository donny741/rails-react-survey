import React, {useEffect} from "react"
import PropTypes from "prop-types"

function Confirm(props) {
  /* CDM */
  useEffect(()=> {
    (async () => {
      /* Synchronously posting data to server */
      await fetch(props.success_url, {
        method: 'POST',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.head.querySelector("[name~=csrf-token][content]").content,
        },
        body: JSON.stringify({
          response: props.questions,
          key: props.ekey
        })
      })
      /* As soon as request is completed, wait 1 sec and show animation */
      setTimeout(Animate, 1000)
    })();
  })
  
  function Animate(){
    var circle = document.getElementById("circle-loader");
    if(circle) {
      circle.setAttribute("style", "top: 20px;")
      var thankyouText = document.getElementById("thankyou-text")
    if (thankyouText) thankyouText.setAttribute("style", "opacity: 1")
    }
    setTimeout(function() {
      circle.classList.add("load-complete");
      var checkmark = document.getElementById("checkmark")
    if(checkmark) checkmark.setAttribute("style", "display: block")
    }, 300)
  }

  console.log(props.questions)
  return (
    <div className="success-wrapper">
      <div id="circle-loader" className="circle-loader">
        <div id="checkmark" className="checkmark draw"></div>
      </div>
      <h2 id="thankyou-text">Ačiū už dalyvavimą!</h2>
    </div>
    
  );
}

Confirm.propTypes = {
  questions: PropTypes.array,
  success_url: PropTypes.string,
  ekey: PropTypes.string,
}

export default Confirm
