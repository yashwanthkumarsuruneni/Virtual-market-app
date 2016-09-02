class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email
  validates_numericality_of :commodities
  validate :lng_lat_restrict_us
  
  def lng_lat_restrict_us
    if (lat.nil? || long.nil?)  
      return true
    elsif (lat.to_f <= 48.987386 ) && (lat.to_f >= 18.005611) && (long.to_f <= -62.361014 ) && (long.to_f >= -124.626080) 
      
      return true
    else
      errors.add(:lat, "Only Us Locations are accepted")
      return false
    end
  end
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
