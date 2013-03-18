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

  def chart
    user = User.find(params[:id])
    render :json => user.donations
  end

  def edit
    user = User.find(params[:id])
  end

  def update
  end
end