class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :end_user_id, null: false
      t.string :post_code, null: false
      t.string :street_address, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
