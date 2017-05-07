class User < ApplicationRecord
  has_many :posts
  has_secure_password
  validates :email, presence: true


  #add email check
end
