class ContentController < ApplicationController
  before_filter :authenticate_user!

  def silver
    authorize! :view, :silver, :message => 'Access limited to Silver Plan subscribers.'
  end

  def gold
    authorize! :view, :gold, :message => 'Access limited to Gold Plan subscribers.'
  end

  def platinum
    authorize! :view, :platinum, :message => 'Access limited to Platinum Plan subscribers.'
  end

  def standard
    authorize! :view, :standard, :message => 'Access limited to Standard Plan subscribers.'
    # @expired_purchases = @current_user.purchases.joins(:promotion).where('promotions.purchase_expiration <= ?', Date.today)
  end

  def premium
    authorize! :view, :premium, :message => 'Access limited to Premium Plan subscribers.'
    # @expired_purchases = @current_user.purchases.joins(:promotion).where('promotions.purchase_expiration <= ?', Date.today)
  end

  def vip
    authorize! :view, :vip, :message => 'Access limited to V.I.P Plan subscribers.'
    # @expired_purchases = @current_user.purchases.joins(:promotion).where('promotions.purchase_expiration <= ?', Date.today)


  end
end
