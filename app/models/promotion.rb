class Promotion < ActiveRecord::Base
  attr_accessible :description, :expiration, :price, :title, :website
end
