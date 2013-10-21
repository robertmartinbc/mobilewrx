class HomeController < ApplicationController
	def index
		@random_promotions = Promotion.limit(1).order("RANDOM()")
		@random1_promotions = Promotion.limit(8).order("RANDOM()")
	end
end
