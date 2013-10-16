class AddHighlightsToPromotion < ActiveRecord::Migration
  def change
    add_column :promotions, :highlights, :text
  end
end
