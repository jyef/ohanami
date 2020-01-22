class ChangeProfileImageToUser < ActiveRecord::Migration[5.2]
  #変更後の型
  def up
    change_column :users, :profile_image, :string, default: "default.png"
  end

  #変更前の型
  def down
    change_column :users, :profile_image, :string
  end
end
