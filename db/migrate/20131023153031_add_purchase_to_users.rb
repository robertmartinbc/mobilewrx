class AddPurchaseToUsers < ActiveRecord::Migration
  def change
    add_column :users, :purchase_id, :integer
    add_index :users, :purchase_id
  end
end
