class CreateSurveyQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :survey_questions do |t|
      t.references :survey, foreign_key: true
      t.references :survey_question_type, foreign_key: true
      t.text :question

      t.timestamps
    end
  end
end
