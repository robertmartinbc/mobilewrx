class AddUserToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :user_id, :integer
    add_index :promotions, :user_id
  end
end
