class CreateSessionUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :session_users, id: :uuid do |t|
      t.uuid :session_id
      t.uuid :shared_session_id
      t.timestamps
    end
  end
end
