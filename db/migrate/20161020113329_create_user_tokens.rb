class CreateUserTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :user_tokens do |t|
      t.string :token, null: false
      t.string :push_token
      t.string :device
      t.integer :user_id

      t.timestamps
    end

    add_index :user_tokens, :token, unique: true
  end
end
