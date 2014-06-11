class PurchasesController < ApplicationController

	respond_to :html, :json

	def show
		@purchase = Purchase.find(params[:id])
    	@promotion = @purchase.promotion
    	respond_with do |format|
      format.json { render json: @purchase }
      format.html { render html: @purchase }
    end
	end
end
