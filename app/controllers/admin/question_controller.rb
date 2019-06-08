module Admin
  class QuestionController < ApplicationController
    layout 'admin'
    def new
      @question = SurveyQuestion.new
      @surveyName = Survey.find(params[:survey_id]).name
    end

    def create
      #Handling data
      permitted = params.require(:survey_question).permit(:question)
      survey_question = SurveyQuestion.new(permitted)
      survey = Survey.find(params[:survey_id])
      comment_needed = params.require(:survey_question).permit(:comment_needed)

      #Reading boolean value of comment_needed
      survey_question.comment_needed = to_bool(comment_needed[:comment_needed])

      #Calculating position
      if survey.survey_questions.order(:position).last.position
        survey_question.position = survey.survey_questions.order(:position).last.position+1
      else
        survey_question.position = 1
      end

      #Saving question and redirecting
      survey.survey_questions << survey_question
      redirect_to admin_survey_path(params[:survey_id])
    end

    def edit
      @question = SurveyQuestion.find(params[:id])
      @surveyName = @question.survey.name
    end

    def update
      #Handling data
      question = SurveyQuestion.find(params[:id])
      permitted = params.require(:survey_question).permit(:question,:comment_needed)

      #updating
      question.question = permitted[:question]
      question.comment_needed = to_bool(permitted[:comment_needed])
      question.save

      redirect_to admin_survey_path(question.survey_id)
    end

    def destroy
      question = SurveyQuestion.find(params[:id])
      redirect_to admin_survey_path(question.survey.id) if question.destroy
    end

    private

    def to_bool value
      ActiveRecord::Type::Boolean.new.deserialize(value)
    end
  end
end
