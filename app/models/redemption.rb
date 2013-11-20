class Redemption < ActiveRecord::Base
  attr_accessible :promotion_id, :user_id

  belongs_to :promotion

  belongs_to :user

  def self.unique(promotion_id, user_id)
  	!Redemption.where(user_id: user_id).all.map{|r|r.promotion_id}.include?(promotion_id)
  end

  # validates :user_id, uniqueness: {scope: :promotion_id, message: 'This has already been redeemed!'}
end
