class CreateSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :sessions, id: :uuid do |t|
      t.uuid :questionnaire_id
      t.uuid :scope_id
      t.timestamps
    end
  end
end
