class User < ApplicationRecord
  has_secure_password

  validates :password, 
            :length => { :in => 5..20 }, 
            :allow_nil => true 
  validates :first_name, :last_name, :email, :street, :number_street, presence: true
  validates :email, uniqueness: true

  reverse_geocoded_by :latitude, :longitude
  geocoded_by :full_street_address
  after_validation :geocode
          

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

  def self.suffixes
    return [["Avenue", "Avenue"],["Drive", "Drive"],["Street", "Street"],["Place", "Place"],["Court", "Court"],["Boulevard", "Boulevard"]]
  end

  def name
    self.first_name + " " + self.last_name
  end

  def full_street_address
    self.number_street.to_s + " " + self.street + " " + "San Francisco"
  end

end
