class CreateScopes < ActiveRecord::Migration[7.1]
  def change
    create_table :scopes, id: :uuid do |t|
      t.string :name
      t.timestamps
    end
  end
end
