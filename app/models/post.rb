class Post < ApplicationRecord
  validates :title, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :feedbacks
  has_many :ratings
end
