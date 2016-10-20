class AddLikeCountToBeers < ActiveRecord::Migration[5.0]
  def change
    add_column :beers, :like_count, :integer, default: 0
  end
end
