class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :salt
      t.string :encrypted_password

      t.timestamps
    end
  end
end
