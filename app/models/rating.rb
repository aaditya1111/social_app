class Rating < ApplicationRecord

  validates :rating, presence: true

  belongs_to :post
end
