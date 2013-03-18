# == Schema Information
#
# Table name: applications
#
#  id         :integer          not null, primary key
#  tagline    :string(255)
#  bio        :text
#  image      :string(255)
#  age        :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  votes      :integer          default(0)
#

require "spec_helper"

describe Application do
  describe ".new" do
    it "creates a new instance of Application" do
      applicaton = Application.new
      expect(applicaton).to be_an_instance_of(Application)
    end
  end

  describe ".create" do
    it "has an id" do
      application = Application.create
      expect(application.id).to_not be nil
    end
    it "has tagline, bio, image, age, votes" do
      application = Application.create(tagline:"a", bio:"b", image:"c", age:1, votes:10)
      expect(application.tagline).to eq "a"
      expect(application.bio).to eq "b"
      expect(application.image).to eq "c"
      expect(application.age). to eq 1
      expect(application.votes). to eq 10
    end
  end

  describe "#user" do
    it "belongs to a user" do
      application = Application.create(tagline:"a", bio:"b", image:"c", age:1, votes:10)
      user = User.create
      user.application = application
      expect(application.user_id).to eq user.id
    end
  end
end
