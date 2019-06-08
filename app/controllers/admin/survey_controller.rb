module Admin
    class SurveyController < ApplicationController
        layout 'admin'
        def index
            @survey = Survey.all
        end
        def create
            permitted = params.require(:survey).permit(:name)
            survey = Survey.new(permitted)
            status = params.require(:survey).permit(:active)
            survey.active = true if status[:active] == 'Yes'
            survey.active = false if status[:active] == 'No'
            survey.save
            redirect_to admin_survey_index_path
        end
        def new
            @survey = Survey.new
        end
        def destroy
            Survey.find(params[:id]).destroy
            redirect_to admin_survey_index_path
        end
        def show
            @survey = Survey.find(params[:id])
            @questions = @survey.survey_questions.order(:position) if params[:id].present?
            @responses = @survey.survey_responses.order(created_at: :desc)
            @response = SurveyResponse.new
        end
        def shiftFeedbackPosition
            position = SurveyQuestion.find(params[:f_id]).position
            redirect_to admin_survey_path(params[:id]) if feedback_change_position(params[:id], position, params[:where])
        end

        def createResponse
            permitted = params.permit(:email)
            survey = Survey.find(params[:id])
            response = survey.survey_responses.new(permitted)
            response.key = Base64.encode64(params[:id] + permitted[:email]).gsub("\n", "").gsub('/', '_').gsub('+', '-')
            response.status = 0
            response.save
            redirect_to admin_survey_path(params[:id]) #if response.send_survey
        end
        
        private
        def feedback_change_position(survey_id, position, where)
            questions = Survey.find(survey_id).survey_questions
            target = questions.find_by(position: position)
            case where
                when "up" then victim = questions.find_by(position: position+1) unless position == questions.count-1
                when "down" then victim = questions.find_by(position: position-1) unless position == 0
            end
            if target && victim 
                target.position, victim.position = victim.position, target.position
                target.save
                victim.save
            end
          end
    end
end