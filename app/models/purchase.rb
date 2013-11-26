class Purchase < ActiveRecord::Base
  attr_accessible :promotion_id, :stripe_reference_id, :user_id

  belongs_to :user

  belongs_to :promotion

  #has_one :redemption
end
