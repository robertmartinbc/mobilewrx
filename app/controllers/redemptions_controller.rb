class RedemptionsController < ApplicationController

	def create
    @promotion = Promotion.find(params[:promotion_id])

    if Redemption.unique(@promotion.id, current_user.id)
      @promotion.redemptions.create(user_id: current_user.id)
      flash[:notice] = "#{@promotion.title} was redeemed."
    else
      flash[:error] = "#{@promotion.title} has already been redeemed!"
    end
    redirect_to root_path
	end
end
