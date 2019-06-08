module Admin 
    class SurveyAnswerController < ApplicationController
        layout 'admin'
        def show
            @response = SurveyResponse.find(params[:id])
            @surveyName = @response.survey.name
            @answers = @response.survey_response_answers
            #too much db calls?
        end
    end
end
