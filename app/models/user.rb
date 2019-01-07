class User < ApplicationRecord
  validates_presence_of :name, :email
  validates_presence_of :password, if: :password
  validates :password, confirmation: { case_sensitive: true }
  has_secure_password

  enum role: ["default", "admin"]
end
