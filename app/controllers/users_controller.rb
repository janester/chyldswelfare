class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.create(params[:user])
    redirect_to(login_path)
  end
  def show
    @auth
  end
end