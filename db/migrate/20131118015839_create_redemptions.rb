class CreateRedemptions < ActiveRecord::Migration
  def change
    create_table :redemptions do |t|
      t.integer :user_id
      t.integer :purchase_id

      t.timestamps
    end
  end
end
