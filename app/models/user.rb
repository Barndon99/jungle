class User < ActiveRecord::Base
  
  has_secure_password
  #Try a validation based approach https://guides.rubyonrails.org/active_record_validations.html
  validates :fname, presence: true
  validates :lname, presence: true
  
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    email = email.strip
    user = User.find_by_email(email)
    (user && user.authenticate(password)) || nil
  end


end
