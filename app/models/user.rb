class User < ApplicationRecord
  has_many :twitter_accounts
  has_many :tweets

  # Rails provides has_secure_password
  # https://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html#method-i-has_secure_password
  # This will take care of validations, bcrypt, and  many other things
  # This also provides virtual fields: "password" and "confirm_password"
  # on top of our real password_digest column
  has_secure_password
  validates(:email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" })
end
