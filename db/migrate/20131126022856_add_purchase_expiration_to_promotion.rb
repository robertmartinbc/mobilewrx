class AddPurchaseExpirationToPromotion < ActiveRecord::Migration
  def change
    add_column :promotions, :purchase_expiration, :date
  end
end
