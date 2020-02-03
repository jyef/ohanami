class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game
  
  has_many :likes
  
  validates :content, presence: true
end
