class ChangeDataShippingNumberToOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :shipping_number, :string
  end
end
