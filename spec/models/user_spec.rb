require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with a password and password_confirmation that match' do
      user = User.new(password: 'securepassword', password_confirmation: 'securepassword', email: 'user@example.com', first_name: 'Test', last_name: 'User')
      expect(user).to be_valid
    end

    it 'is not valid when password and password_confirmation do not match' do
      user = User.new(password: 'password1', password_confirmation: 'password2')
      expect(user).to_not be_valid
    end

    it 'is not valid without a password and password_confirmation' do
      user = User.new(email: 'user@example.com')
      expect(user).to_not be_valid
    end

    it 'requires unique emails, case insensitive' do
      User.create(password: 'test', password_confirmation: 'test', email: 'test@example.com', first_name: 'Test', last_name: 'User')
      user = User.new(password: 'test', password_confirmation: 'test', email: 'TEST@example.com')
      expect(user).to_not be_valid
    end

    it 'authenticates a user even if their email has leading/trailing spaces' do
      authenticated_user = User.authenticate_with_credentials('  example@domain.com  ', 'password123')
      expect(authenticated_user).to eq(@user)
    end

    it 'is not valid without an email, first name, and last name' do
      user = User.new(password: 'securepassword', password_confirmation: 'securepassword')
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'is not valid with a password shorter than 6 characters' do
      user = User.new(password: 'short', password_confirmation: 'short')
      expect(user).to_not be_valid
    end    
  end

end
