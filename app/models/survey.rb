class Survey < ApplicationRecord
    has_many :survey_questions
    has_many :survey_responses

    validates :name, presence: true
end


