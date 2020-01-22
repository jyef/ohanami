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
end
