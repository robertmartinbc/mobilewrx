class AddQrcodeToPromotions < ActiveRecord::Migration
  def change
    add_column :promotions, :qrcode, :string
  end
end
