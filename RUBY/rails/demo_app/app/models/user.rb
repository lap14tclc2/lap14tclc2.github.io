class User < ApplicationRecord
    # save email to database as downcase form
    before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\d+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum:100 },
                format: { with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false}
    
    validates :password, presence: true, length: {minimum:6}, allow_blank: true
    has_secure_password
end
