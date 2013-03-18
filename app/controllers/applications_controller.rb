class ApplicationsController < ApplicationController
  def index
    @applications = Application.order(:votes).reverse
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.create(params[:application])
    @auth.application = @application
    @auth.save
    @applications = Application.order(:votes).reverse
  end

  def vote
    app = Application.find(params[:id])
    app.votes += 1
    app.save
    @auth.times_voted += 1
    @auth.save
    render :json => {applications:Application.order(:votes).reverse, user:@auth, donations:@auth.donations}
  end
end


