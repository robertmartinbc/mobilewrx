class Promotion < ActiveRecord::Base
  attr_accessible :description, :expiration, :price, :title, :website, :image, :qrcode, :details, :highlights, :about, :company_info, :fine_print

  belongs_to :user

  has_many :purchases

  has_many :redemptions

  default_scope order('created_at DESC')

  mount_uploader :image, ImageUploader
  mount_uploader :qrcode, QrcodeUploader

  validates :title, length: { maximum: 20 }, presence: true
  validates :description, length: { maximum: 25 }, presence: true
  validates :price, presence: true
  validates :expiration, presence: true
  validates :website, presence: true
  validates :image, presence: true
  validates :qrcode, presence: true

  def stripe_price
    price * 100
  end
end
