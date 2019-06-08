import React, {useState} from "react"
import PropTypes from "prop-types"
function Questions(props) {
  /* State Hooks */
  const [question, setQuestion] = useState(0)
  const [comment, setComment] = useState("")

  /* Continue function */
  function Continue(e) {

    e.preventDefault()
    console.log(props.questions)
    if(comment != ""){
      props.questions[question].comment = comment
      setComment("")
      
    }
    for(let i = 1; i<6;i++) {
      if(!props.questions[question].comment_needed && document.getElementById("star"+i).checked){
        props.questions[question].score = i
        document.getElementById("star"+i).checked = false
      }
    }
    if(question != props.questions.length-1){
      setQuestion(question+1)
    } else {
      props.nextStep();
    }
  }

  /* Old render method */
  const {questions} = props
  let rating
  if(question != props.questions.length && !questions[question].comment_needed) {
    rating =  <div className="rating">
                <input type="radio" id="star5" name="rating" value="5" /><label htmlFor="star5"></label>
                <input type="radio" id="star4" name="rating" value="4" /><label htmlFor="star4"></label>
                <input type="radio" id="star3" name="rating" value="3" /><label htmlFor="star3"></label>
                <input type="radio" id="star2" name="rating" value="2" /><label htmlFor="star2"></label>
                <input type="radio" id="star1" name="rating" value="1" /><label htmlFor="star1"></label>
              </div>
  } else {
    rating =  <div className="comment">
                <textarea placeholder="Komentaras" id="comment" type="text" name="fname" value={comment} onChange={e => setComment(e.target.value)}></textarea>
              </div>
  }
  
  return (
    <div>
      <div className="feedback-header">
        <h1>{questions[question].question}</h1>
        {rating}
      </div>
      <div className="navigation">
        <a onClick={Continue} className="next-button">Tęsti</a>
      </div>
    </div>
  );
}

Questions.propTypes = {
  questions: PropTypes.array,
  nextStep: PropTypes.func
}

export default Questions
