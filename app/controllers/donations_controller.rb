class DonationsController < ApplicationController
  def index
    @donations = Donation.order(:amount).reverse
  end

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.create(params[:donation])
    @auth.donations << @donation
    @donations = Donation.order(:amount).reverse
  end
end