require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'creates a user with valid fields' do
      @no_blanks = User.new(fname: 'barndon', lname: 'rowland', email: 'row@gmail.com', password: 'hellothere', password_confirmation: 'hellothere')
      expect(@no_blanks).to be_valid
    end

    it 'raises an error when first name is blank' do
      @user = User.new(lname: 'rowland', email: 'row@gmail.com', password: 'hellothere', password_confirmation: 'hellothere')
      expect(@user).not_to be_valid
    end

    it 'raises an error when last name is blank' do
      @user = User.new(fname: 'rowland', email: 'row@gmail.com', password: 'hellothere', password_confirmation: 'hellothere')
      expect(@user).not_to be_valid
    end

    it 'raises an error when no email is provided' do
      @user = User.new(lname: 'rowland', email: 'row@gmail.com', password: 'hellothere', password_confirmation: 'hellothere')
      expect(@user).not_to be_valid
    end

    it 'requires password and confirmation to match' do
      @user1 = User.new(fname: 'barndon', lname: 'rowland', email: 'row@gmail.com', password: 'hellothere', password_confirmation: 'hellothere')
      @user2 = User.new(fname: 'barndon', lname: 'rowland', email: 'row@gmail.com', password: 'hellothere', password_confirmation: 'thisdoesntmatch')
      expect(@user1).to be_valid
      expect(@user2).not_to be_valid
    end

  end

  #describe '.authenticate_with_credentials' do
  #  # examples for this class method here
  #end

end