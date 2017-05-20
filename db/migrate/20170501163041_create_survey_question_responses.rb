class CreateSurveyQuestionResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :survey_question_responses do |t|
      t.references :contact, foreign_key: true
      t.references :survey, foreign_key: true
      t.references :survey_question, foreign_key: true
      t.boolean :boolean_response
      t.integer :rate_response
      t.text :written_response

      t.timestamps
    end
  end
end
