class CreateProductProperties < ActiveRecord::Migration
  def change
    create_table :product_properties do |t|
      t.integer  :product_id
      t.string   :volume
      t.string   :performance
      t.decimal  :property_price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
