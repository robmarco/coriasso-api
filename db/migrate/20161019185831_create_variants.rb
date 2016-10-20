class CreateVariants < ActiveRecord::Migration[5.0]
  def change
    create_table :variants do |t|
      t.string :size
      t.integer :price, default: 0
      t.integer :status, default: 0
      t.integer :beer_id

      t.timestamps
    end
  end
end
