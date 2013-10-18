class AddAboutToPromotion < ActiveRecord::Migration
  def change
    add_column :promotions, :about, :text
  end
end
