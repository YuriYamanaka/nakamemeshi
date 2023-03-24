class AddDetailsToFoods < ActiveRecord::Migration[6.1]
  def change
    add_column :foods, :lat, :float
    add_column :foods, :lng, :float
  end
end
