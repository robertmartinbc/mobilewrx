class HomeController < ApplicationController
	def index
		@random_promotions = Promotion.active.limit(1).order("RANDOM()")
		@random1_promotions = Promotion.active.limit(4).order("RANDOM()")
	end
end
