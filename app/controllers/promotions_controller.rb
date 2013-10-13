class PromotionsController < ApplicationController
  def index
  	@promotions = Promotion.all
  end

  def show
  	@promotion = Promotion.find(params[:id])
  end

  def new
  end

  def edit
  end
end
