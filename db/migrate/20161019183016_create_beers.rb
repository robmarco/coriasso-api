class CreateBeers < ActiveRecord::Migration[5.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :origin
      t.float :abv
      t.text :description

      t.timestamps
    end
  end
end
