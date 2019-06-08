class CreateSurveyQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_questions do |t|
      t.string :question
      t.boolean :comment_needed
      t.integer :position

      t.timestamps
    end
    add_reference :survey_questions, :survey
  end
end
