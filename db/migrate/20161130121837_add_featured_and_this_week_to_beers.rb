class AddFeaturedAndThisWeekToBeers < ActiveRecord::Migration[5.0]
  def change
    add_column :beers, :featured, :boolean, default: false
    add_column :beers, :this_week, :boolean, default: false
    add_index :beers, :featured
    add_index :beers, :this_week
  end
end
