class CreateRedemptions < ActiveRecord::Migration
  def change
    create_table :redemptions do |t|
      t.integer :user_id
      t.integer :promotion_id

      t.timestamps
    end
  end
end
