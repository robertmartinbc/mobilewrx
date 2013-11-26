class HomeController < ApplicationController
	def index
		@random_promotions = Promotion.where("purchase_expiration > ?", Date.today).limit(1).order("RANDOM()")
		@random1_promotions = Promotion.where("purchase_expiration > ?", Date.today).limit(4).order("RANDOM()")
	end
end
