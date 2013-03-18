# == Schema Information
#
# Table name: donations
#
#  id         :integer          not null, primary key
#  amount     :decimal(, )
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  name       :string(255)
#

class Donation < ActiveRecord::Base
  attr_accessible :amount, :date, :name
  belongs_to :user

  before_create :add_date
end

def add_date
  self.date = Date.current.to_s
end
