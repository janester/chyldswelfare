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

require "spec_helper"

describe Donation do
  describe ".new" do
    it "creates an instance of Donation" do
      donation = Donation.new
      expect(donation).to be_an_instance_of(Donation)
    end
  end

  describe ".create" do
    it "has an id" do
      donation = Donation.create
      expect(donation.id).to_not be nil
    end

    it "has an amount and date" do
      donation = Donation.create(amount:100)
      expect(donation.amount).to eq 100
      expect(donation.date.to_s).to eq Date.current.to_s
    end
  end

  describe "#user" do
    it "belongs to user" do
      donation = Donation.create(amount:100, date:"2013-03-02")
      user = User.create(name: 'jack', email: 'jack@gmail.com', password: 'a', password_confirmation: 'a')
      user.donations << donation
      expect(donation.user_id).to eq user.id
    end
  end
end
