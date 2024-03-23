class CreateQuestionnaires < ActiveRecord::Migration[7.1]
  def change
    create_table :questionnaires, id: :uuid do |t|
      t.uuid :category_id
      t.timestamps
    end
  end
end
