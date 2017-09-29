class User < ApplicationRecord
  has_many :posts
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validate :email_valid?



  def email_valid?
    if !email.include?("@skcdc.org")
      errors.add(:email, "must be an skcdc email")
    end
  end

  def self.super_count
     User.where(super: 'true').count
  end



end
