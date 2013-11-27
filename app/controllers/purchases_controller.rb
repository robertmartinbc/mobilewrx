class PurchasesController < ApplicationController

	def show
		@purchase = Purchase.find(params[:id])
    @promotion = @purchase.promotion
	end
end
