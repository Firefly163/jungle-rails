class Review < ActiveRecord::Base
  validates :description, :rating, presence: true
  belongs_to :user
  belongs_to :product
end
