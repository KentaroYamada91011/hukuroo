class CreateSpreeUserBillings < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_user_billings do |t|
      t.integer :user_id
      t.boolean :is_billing
      t.date :expired_date
      t.integer :return_status

      t.timestamps
    end
  end
end
