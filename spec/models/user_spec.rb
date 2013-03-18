# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  is_donor        :boolean
#  is_applicant    :boolean
#  times_voted     :integer          default(0)
#

require 'spec_helper'

describe User do
  describe '.new' do
    it 'creates an instance of User' do
      user = User.new
      expect(user).to be_an_instance_of(User)
    end
    it 'has name, email, password and password_confirmation' do
      user = User.new(name: 'jack', email: 'jack@gmail.com', password: 'a', password_confirmation: 'a')
      expect(user.name).to eq 'jack'
      expect(user.email).to eq 'jack@gmail.com'
      expect(user.password).to eq 'a'
      expect(user.password_confirmation).to eq 'a'
    end
  end

  describe '.create' do
    it 'has an id' do
      user = User.create(name: 'jack', email: 'jack@gmail.com', password: 'a', password_confirmation: 'a')
      expect(user.id).to_not be nil
    end

    # it 'fails validation if name or email is blank while supplying password' do
    #   user = User.create(:password => 'a', :password_confirmation => 'a')
    #   expect(user.id).to be nil
    # end
  end

  describe '#application' do
    it 'has one application' do
      user = User.create(name: 'jack', email: 'jack@gmail.com', password: 'a', password_confirmation: 'a')
      application = Application.create(tagline: 'heyhey', bio: 'hey', image: 'img', age: 26)
      user.application = application
      expect(user.application).to eq application
    end
  end
end
