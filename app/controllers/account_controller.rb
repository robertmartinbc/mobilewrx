class AccountController < ApplicationController
  def show
  	if current_user.roles.first.name == 'admin'
  		redirect_to users_path
  	elsif
  		current_user.roles.first.name == 'platinum'
  		redirect_to content_platinum_path
  	elsif
  		current_user.roles.first.name == 'gold'
  		redirect_to content_gold_path
  	elsif
			current_user.roles.first.name == 'silver'
			redirect_to content_silver_path
		elsif
			current_user.roles.first.name == 'standard'
			redirect_to content_standard_path
		elsif
			current_user.roles.first.name == 'standard'
			redirect_to content_standard_path
		elsif
			current_user.roles.first.name == 'standard'
			redirect_to content_standard_path
		else
			root_path
		end
	end
end
