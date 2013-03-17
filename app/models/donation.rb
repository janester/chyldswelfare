class Donation < ActiveRecord::Base
  attr_accessible :amount, :date, :name
  belongs_to :user

  before_create :add_date
end

def add_date
  self.date = Date.current.to_s
end
