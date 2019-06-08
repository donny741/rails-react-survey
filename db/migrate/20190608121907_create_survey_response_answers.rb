class CreateSurveyResponseAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_response_answers do |t|
      t.string :question
      t.integer :score
      t.string :comment
      t.string :key

      t.timestamps
    end
    add_reference :survey_response_answers, :survey_response
  end
end
