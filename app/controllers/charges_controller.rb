class ChargesController < ApplicationController

        respond_to :html, :json

        def new
        end

        def create
                @promotion = Promotion.find(params[:promotion_id])
                # Amount in cents
                @amount = @promotion.stripe_price
                respond_with do |format|
                      format.json { render json: @amount }
                      format.html { render html: @amount }
                end

                customer = Stripe::Customer.create(
                        :email => 'example@stripe.com',
                        :card => params[:stripeToken]
                        )
                charge = Stripe::Charge.create(
                        :customer    => customer.id,
                        :amount      => @promotion.stripe_price,
                        :description => 'Rails Stripe customer',
                        :currency    => 'usd'
                        )
                Purchase.create(promotion_id: @promotion.id, user_id: current_user.id, stripe_reference_id: params[:stripeToken])
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

# Set your secret key: remember to change this to your live secret key in production
# See your keys here https://manage.stripe.com/account
# Stripe.api_key = "sk_test_J1uwwu0FevHqThdeRVfyk52u"

# # Get the credit card details submitted by the form
# token = params[:stripeToken]

# # Create a Customer
# customer = Stripe::Customer.create(
#   :card => token,
#   :description => "payinguser@example.com"
# )

# # Charge the Customer instead of the card
# Stripe::Charge.create(
#     :amount => 1000, # in cents
#     :currency => "cad",
#     :customer => customer.id
# )

# # Save the customer ID in your database so you can use it later
# save_stripe_customer_id(user, customer.id)

# # Later...
# customer_id = get_stripe_customer_id(user)

# Stripe::Charge.create(
#   :amount   => 1500, # $15.00 this time
#   :currency => "cad",
#   :customer => customer_id
# )
