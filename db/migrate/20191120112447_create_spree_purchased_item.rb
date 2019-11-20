class CreateSpreePurchasedItem < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_purchased_items do |t|
      t.integer :product_id
      t.integer :user_id
      t.datetime :purchased_time
      t.string :state
      t.string :paymentstate
      t.string :description
      t.integer :price
    end
  end
end
