class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :beer_id
      t.integer :user_id
      t.integer :rate
      t.text :comment

      t.timestamps
    end
  end
end
