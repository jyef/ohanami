class User < ApplicationRecord
  attr_accessor :current_password
  validates :password, presence: { if: :current_password }
  
  # アップローダーの設定
  mount_uploader :profile_image, UserImageUploader
  
  before_save { self.email.downcase! }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :games
  has_many :reviews
  has_many :review_games, through: :reviews, source: :game
  has_many :stamps
  has_many :have_stamps, through: :stamps, source: :game
  has_many :likes
  has_many :myfavorites, through: :likes, source: :review
  
  def favorite(review)
      self.likes.find_or_create_by(review_id: review.id)
  end
  
  def unfavorite(review)
    favorite = self.likes.find_by(review_id: review.id)
    favorite.destroy if favorite
  end
  
  def likeit?(review)
    self.myfavorites.include?(review)
  end
  
  def have_stamp?(game)
    self.have_stamps.include?(game)
  end
end
