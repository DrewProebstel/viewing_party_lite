class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties
  validates_presence_of :name, :email
  validates_presence_of :password_digest, require: true
  validates_uniqueness_of :email
  validates :password, confirmation: true
  has_secure_password
end
