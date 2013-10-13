class Promotion < ActiveRecord::Base
  attr_accessible :description, :expiration, :price, :title, :website, :image, :qrcode

  belongs_to :user

  default_scope order('created_at DESC')

  mount_uploader :image, ImageUploader
  mount_uploader :qrcode, QrcodeUploader
end
