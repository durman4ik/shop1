class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.text   :address
      t.string :city
      t.string :zip_code
      t.string :phone
      t.string :email
      t.string :pay_type
      t.string :delivery_type

      t.timestamps
    end
  end
end
