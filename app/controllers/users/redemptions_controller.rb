class Users::RedemptionsController < ApplicationController
	def index
    @redemptions = current_user.redemptions
	end

	def show
    @redemption = Redemption.find(params[:id])
  end
end
