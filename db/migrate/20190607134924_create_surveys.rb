class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.string :name
      t.boolean :active
      t.integer :mail_type

      t.timestamps
    end
  end
end
