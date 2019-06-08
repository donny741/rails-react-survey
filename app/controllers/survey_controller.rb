class SurveyController < ApplicationController
    def new
        @questions = []
        response = SurveyResponse.find_by(key: params[:id])
        
        if response.present? && response.status != 2
            response
            key = Base64.decode64(params[:id].gsub('_','/').gsub('-','+'))
            @key = params[:id]
            @questions = response.survey.survey_questions.order(:position).as_json(only: [:question, :comment_needed]) if response.survey.present?
            response.status = 1
            response.initial_score = params[:score] if params[:score].present?
            response.save
            #SurveyMailer.with(response: response).notify_when_opened.deliver_now
        end
    end
    
    def updateResponse
        #Checking data
        data = params[:response]
        raise "No response received" if data.nil?
        response = SurveyResponse.find_by(key: params[:key])
        raise "Cannot find the response" unless response

        #Saving to database
        data.each do |q|
            permitted = q.permit(:question, :score, :comment)
            ans = response.survey_response_answers.new(permitted)
            ans.save
        end

        #Changing response status
        response.status = 2
        response.save

        #SurveyMailer.with(response: response).notify_when_completed.deliver_now
    end
end
