class AddStyleIdToBeers < ActiveRecord::Migration[5.0]
  def change
    add_column :beers, :style_id, :integer
  end
end
