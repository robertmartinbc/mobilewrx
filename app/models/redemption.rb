class Redemption < ActiveRecord::Base
  attr_accessible :purchase_id, :user_id
# belongs_to :purchase
  belongs_to :purchase

  belongs_to :user

  def self.unique(purchase_id, user_id)
  	!Redemption.where(user_id: user_id).all.map{|r|r.purchase_id}.include?(purchase_id)
  end

  # validates :user_id, uniqueness: {scope: :purchase_id, message: 'This has already been redeemed!'}
end
