class CreateQuestionnaireQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questionnaire_questions, id: :uuid do |t|
      t.uuid :questionnaire_id
      t.uuid :question_id
      t.timestamps
    end
  end
end
