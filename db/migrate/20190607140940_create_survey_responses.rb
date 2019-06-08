class CreateSurveyResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_responses do |t|
      t.integer :status
      t.integer :initial_score
      t.string :email
      t.string :key

      t.timestamps
    end
    add_reference :survey_responses, :survey
  end
end
