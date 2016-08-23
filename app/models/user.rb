class User < ApplicationRecord
  has_secure_password

  validates :password, 
            :length => { :in => 5..20 }, 
            :allow_nil => true 
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
          

  def generate_token
    begin
      self[:auth_token] = SecureRandom.urlsafe_base64
    end while User.exists?(:auth_token => self[:auth_token])
  end

  def regenerate_auth_token
    self.auth_token = nil
    generate_token
    save!
  end
end
