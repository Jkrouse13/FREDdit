class User < ApplicationRecord
  has_secure_password

  has_many :posts
  has_many :votes
  validates_presence_of :name, :email
  validates :name, :email, uniqueness: true
end
