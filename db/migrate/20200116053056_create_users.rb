class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :profile_image
      t.string :nickname
      t.string :introduction
      t.string :twitter

      t.timestamps
    end
  end
end
