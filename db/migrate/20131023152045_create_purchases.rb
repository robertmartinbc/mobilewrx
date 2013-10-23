class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :purchase_id
      t.integer :user_id
      t.string :stripe_reference_id

      t.timestamps
    end
  end
end
