class Post < ApplicationRecord
  validates :title, presence: true
  validates :user_id, presence: true
  validates :author_ip, presence: true
  validates :content, presence:true

  belongs_to :user
  has_many :feedbacks
  has_many :ratings
end
