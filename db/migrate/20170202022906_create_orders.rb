class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.float :subtotal
      t.float :tax
      t.float :total
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
