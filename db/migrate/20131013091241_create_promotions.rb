class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.date :expiration
      t.string :website

      t.timestamps
    end
  end
end
