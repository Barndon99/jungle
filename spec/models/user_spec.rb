require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'creates a user with valid fields' do
    @no_blanks = User.new(fname: 'barndon', lname: 'rowland', email: 'row@gmail.com', password: 'hellothere', password_confirmation: 'hellothere')
    expect(@no_blanks).to be_valid
    end
  end

  #describe '.authenticate_with_credentials' do
  #  # examples for this class method here
  #end

end