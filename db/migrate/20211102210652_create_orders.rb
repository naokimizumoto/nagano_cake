class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :payment_method
      t.string :adress
      t.string :postal_code
      t.string :name
      t.integer :shipping_cost
      t.integer :total_payment
      t.integer :status
      t.timestamps
    end
  end
end
