class User < ApplicationRecord
  has_many :user_plants
  has_many :plants, through: :user_plants
  has_secure_password
  validates :username, uniqueness: {case_sensitive: false}
end
