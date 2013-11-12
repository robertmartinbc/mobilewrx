class PromotionsController < ApplicationController

  respond_to :html, :json

  def index
  	@promotions = Promotion.paginate(page: params[:page], per_page: 4)
      respond_with do |format|
      format.json { render json: @promotions}
      format.html { render html: @promotions}
    end
  end

  def show
  	@promotion = Promotion.find(params[:id])
  end

  def new
    @promotion = Promotion.new
  end

  def create
  @promotion = current_user.promotions.build(params[:promotion])
  if @promotion.save
    flash[:notice] = "Promotion was saved."
    redirect_to @promotion
  else
    flash[:error] = "There was an error saving the promotion. Please try again."
    render :new
  end
end

  def edit
    @promotion = Promotion.find((params[:id]))
    # authorize! :edit, @promotion, message: "You need to own the promotion to edit it."
  end

  def update
    @promotion = Promotion.find(params[:id])
    if @promotion.update_attributes(params[:promotion])
      flash[:notice] = "Promotion was updated."
      redirect_to @promotion
    else
      flash[:error] = "There was an error saving the promotion. Please try again."
      render :new
    end
  end

  def view
    @promotion = Promotion.find(3)
  end
end
