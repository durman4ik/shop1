class AddColumnsToProducts < ActiveRecord::Migration
  def up
    change_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price, precision: 8, scale: 2
    end
  end

  def down
    remove_columns :products, :title, :description, :image_url, :price
  end
end
