class AddImageToBeer < ActiveRecord::Migration[5.0]
  def up
    add_attachment :beers, :image
  end

  def down
    remove_attachment :beers, :image
  end
end
