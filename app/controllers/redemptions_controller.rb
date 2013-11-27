class RedemptionsController < ApplicationController

	def create
    @purchase = Purchase.find(params[:purchase_id])
    if Redemption.unique(@purchase.id, current_user.id)
      @redemption = Redemption.new(user_id: current_user.id, purchase_id: @purchase.id)
      if @redemption.save
        flash[:notice] = "#{@purchase.promotion.title} was redeemed."
      else
        flash[:error] = "#{@purchase.promotion.title} was not redeemed."
      end
    else
      flash[:error] = "#{@purchase.promotion.title} was already redeemed."
    end
    redirect_to root_path
	end

  def show
    @redemption = Redemption.find(params[:id])
  end
end
