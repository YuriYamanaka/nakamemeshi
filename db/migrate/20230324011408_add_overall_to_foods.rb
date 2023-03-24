class AddOverallToFoods < ActiveRecord::Migration[6.1]
  def change
    add_column :foods, :overall, :integer
  end
end
