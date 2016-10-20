class CreateFavoriteBeers < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_beers do |t|
      t.integer :beer_id
      t.integer :user_id

      t.timestamps
    end
  end
end
