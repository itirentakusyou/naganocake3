class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.integer :genre_id
      t.string :name
      t.text :text
      t.boolean :is_sales_status, default: false, null: false
      t.integer :price

      t.timestamps
    end
  end
end
