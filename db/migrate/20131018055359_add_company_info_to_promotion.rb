class AddCompanyInfoToPromotion < ActiveRecord::Migration
  def change
    add_column :promotions, :company_info, :text
  end
end
