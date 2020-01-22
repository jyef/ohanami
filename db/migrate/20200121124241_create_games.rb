class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.string :url
      t.string :icon
      t.string :genre
      t.string :information
      t.string :play_time
      t.string :intro_image1
      t.string :intro_image2
      t.string :intro_image3
      t.string :intro_image4
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
