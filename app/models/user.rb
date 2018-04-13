class User < ApplicationRecord
  before_save{self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  has_secure_password
  validates :name, presence: true, length: {maximum: Settings.user.maximum_name}
  validates :email, presence: true, length: {maximum: Settings.user.maximum_email},
  format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.user.minimum_password}
end
