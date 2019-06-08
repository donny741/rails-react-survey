class SurveyResponseAnswer < ApplicationRecord
    belongs_to :survey_response

    validates :question, presence: true
end
