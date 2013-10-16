class AddDetailsToPromotion < ActiveRecord::Migration
  def change
    add_column :promotions, :details, :text
  end
end
