class Update < ApplicationRecord
  belongs_to :game
  
  # validates :update_day, presence: true
  # validates :update_info, presence: true
end
