class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      t.integer :item_id
      t.integer :order_id
      t.integer :quantity
      t.integer :making_status, default: 0
      t.integer :purchase_price
      t.timestamps
    end
  end
end
