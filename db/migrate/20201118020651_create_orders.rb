class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id, null: false
      t.integer :shipping_number, null: false
      t.integer :shipping_price, null: false
      t.string :shipping_name, null: false
      t.string :shipping_address, null: false
      t.integer :billing_price, null: false
      t.integer :payment_method,default:0, null: false
      t.integer :order_status,default:0, null: false
      t.timestamps
    end
  end
end
