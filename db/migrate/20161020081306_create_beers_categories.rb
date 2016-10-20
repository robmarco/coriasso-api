class CreateBeersCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :beers_categories, id: false do |t|
      t.belongs_to :beer, index: true
      t.belongs_to :category, index: true
    end
  end
end
