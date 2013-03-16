class Donation < ActiveRecord::Base
  attr_accessible :amount, :date
  belongs_to :user
end