class CreateAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :answers, id: :uuid do |t|
      t.uuid :question_id
      t.string :text
      t.integer :score
      t.timestamps
    end
  end
end
