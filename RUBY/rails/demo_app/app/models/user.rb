class User < ApplicationRecord
  attr_accessor :remember_token

  # save email to database as downcase form
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\d+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum:100 },
                format: { with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false}
    
  validates :password, presence: true, length: {minimum:6}, allow_blank: true
  has_secure_password

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #add token
  def remember 
    #get random token
    self.remember_token = User.new_token
    # save the encrypted token to database
    update_attributes(:remember_digest, User.digest(remember_token))
  end

  #remove token
  def forget
    update_attributes(:remember_digest, nil)
  end

  #check given token is matches encrypted version in database
  def authenticated?(remember_token)
    # check if remeber_digest of current user is nil
    return false if remember_digest.nil?
    # compare old token and given token
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
end
