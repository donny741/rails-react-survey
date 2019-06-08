import React, {useState, useEffect} from "react"
import PropTypes from 'prop-types'
import Confirm from './components/Confirm'
import Intro from './components/Intro'
import Questions from './components/Questions'
import Error from './Error'

function Router(props) {
  /* State hooks */
  const [step, setStep] = useState(1);
  const [questions, setQuestions] = useState([]);

  /* CDM */
  useEffect(() => {
    setQuestions(props.questions)
    if(props.questions.length == 0) setStep(0)
  })

  /* Switching between steps */
  switch(step) {
    //Initial case
    case 1:
      return (
        <Intro 
          nextStep = {() => setStep(step+1)}
          questions = {questions}
        />
      );

      //Questions case
      case 2:
      return (
        <Questions 
          nextStep = {() => setStep(step+1)}
          questions = {questions}
        />
      );

      //Success case
      case 3:
      return (
        <Confirm 
          questions = {questions}
          success_url = {props.success_url}
          ekey = {props.ekey}
        />
      );
      case 0:
      return(
        <Error />
      );
  }
}

Router.propTypes = {
  questions: PropTypes.array,
  success_url: PropTypes.string,
  ekey: PropTypes.string
}

export default Router
