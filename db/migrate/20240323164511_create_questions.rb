class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions, id: :uuid do |t|
      t.string :statement
      t.string :question_type
      t.timestamps
    end
  end
end
