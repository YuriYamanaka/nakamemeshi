class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :genre
      t.string :address
      t.integer :cost
      t.text :about
      t.date :date
      t.integer :user_id
      t.string :image

      t.timestamps
    end
  end
end
