class User < ActiveRecord::Base
  
  has_secure_password
  #Try a validation based approach https://guides.rubyonrails.org/active_record_validations.html
  validates :fname, presence: true
  validates :lname, presence: true

  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    user = where(fname)[0]
    user && user.authenticate(password)
  end


end
