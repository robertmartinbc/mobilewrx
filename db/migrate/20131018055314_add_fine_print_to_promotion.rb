class AddFinePrintToPromotion < ActiveRecord::Migration
  def change
    add_column :promotions, :fine_print, :text
  end
end
