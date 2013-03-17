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
end


