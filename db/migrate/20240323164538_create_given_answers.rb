class CreateGivenAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :given_answers, id: :uuid do |t|
      t.uuid :session_id
      t.uuid :answer_id
      t.string :text
      t.timestamps
    end
  end
end
