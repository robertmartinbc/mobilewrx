class ChargesController < ApplicationController
	def new
	end

	def create
		# Amount in cents
		@amount = @promotion.price

		customer = Stripe::Customer.create(
			:email => 'example@stripe.com',
			:card => params[:stripeToken]
			)
		charge = Stripe::Charge.create(
			:customer    => customer.id,
			:amount      => @promotion.price,
			:description => 'Rails Stripe customer',
			:currency    => 'usd'
			)
	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to charges_path
	end
end

# def create
#       promotion = Promotion.find(params[:promotion_id])
#
#       charge = Stripe::Charge.create(amount: promotion.amount, customer: current_user.customer_id)
#
#      user.purchased_promotions.create!(promotion_id: promotion.id, stripe_charge_id: charge.transaction_id)
#end
