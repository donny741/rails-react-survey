class SurveyResponse < ApplicationRecord
    belongs_to :survey
    has_many :survey_response_answers
    
    validates :email, presence: true
    validates :key, presence: true
end
