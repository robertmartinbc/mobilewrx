class Purchase < ActiveRecord::Base
  attr_accessible :purchase_id, :stripe_reference_id, :user_id

  belongs_to :user

  has_many :promotions
end
