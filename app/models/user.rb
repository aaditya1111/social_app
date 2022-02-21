class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :mobile, presence: true

  has_many :posts
  has_many :feedbacks
end
