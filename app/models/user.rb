class User < ApplicationRecord
  has_many :jobs
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: {case_sesitive: false},
   length:{maximum: 50},
   format: {with: VALID_EMAIL_REGEX}
   has_secure_password
end
