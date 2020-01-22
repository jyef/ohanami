class ChangeProfileImage < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :profile_image, from: "default.png", to: nil
  end
end
