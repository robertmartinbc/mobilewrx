class Api::SessionsController < ApplicationController
  respond_to :json

  before_filter :load_user, :authenticate_session, only: :create

  def create
    sign_in :user, @user
    respond_with @user, location: nil
  end

  def destroy
    sign_out current_user
    render nothing: true, status: 200
  end

  private

    def authenticate_session
      return if valid_session?
      respond_with(invalid_session, status: 401, location: nil)
    end

    def load_user
      @user = User.find_for_database_authentication(email: params[:email])
    end

    def invalid_session
      {message: 'Error with your email or password'}
    end

    def session_params
      params.require(:sessions)
    end

    def valid_session?
      @user.try(:valid_password?, params[:password])
    end
end
