class Game < ApplicationRecord
  belongs_to :user
  
  # アップローダーの設定
  mount_uploader :icon, IconUploader
  mount_uploader :intro_image1, Intro1Uploader
  mount_uploader :intro_image2, Intro2Uploader
  mount_uploader :intro_image3, Intro3Uploader
  mount_uploader :intro_image4, Intro4Uploader
  
  has_many :updates
  accepts_nested_attributes_for :updates, reject_if: :reject_blank, allow_destroy: true
  
  def reject_blank(attributes)
    exists = attributes[:id].present?
    empty = attributes[:update_info].blank?
    attributes.merge!(_destroy: 1) if exists && empty
    !exists && empty
  end
  
  has_many :reviews
  has_many :reviewers, through: :reviews, source: :user 
  has_many :stamps
end
