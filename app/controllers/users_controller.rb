class UsersController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html, :json

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
    respond_with do |format|
      format.json { render json: @users }
      format.html { render html: @users }
    end
  end

  def show
    @user = User.find(params[:id])
    respond_with do |format|
      format.json { render json: @user }
      format.html { render html: @user }
    end
  end

  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    role = Role.find(params[:user][:role_ids]) unless params[:user][:role_ids].nil?
    params[:user] = params[:user].except(:role_ids)
    if @user.update_attributes(params[:user])
      @user.update_plan(role) unless role.nil?
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
end
