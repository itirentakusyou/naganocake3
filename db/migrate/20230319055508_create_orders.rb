class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :id
      t.integer :coutomer_id
      t.string :post_code
      t.string :address
      t.string :name
      t.integer :total_cost
      t.integer :postage
      t.integer :payment_method
      t.integer :order_status
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
