class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.integer :status, default: 0

      t.timestamps
    end

    add_index :categories, :status
  end
end
