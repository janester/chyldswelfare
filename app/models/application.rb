# == Schema Information
#
# Table name: applications
#
#  id         :integer          not null, primary key
#  tagline    :string(255)
#  bio        :string(255)
#  image      :string(255)
#  age        :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  votes      :integer          default(0)
#

class Application < ActiveRecord::Base
  attr_accessible :tagline, :bio, :image, :age, :votes
  belongs_to :user
end
