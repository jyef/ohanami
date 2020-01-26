class CreateStamps < ActiveRecord::Migration[5.2]
  def change
    create_table :stamps do |t|
      t.boolean :story, default: false, null: false
      t.boolean :game_system, default: false, null: false
      t.boolean :graphic, default: false, null: false
      t.boolean :game_character, default: false, null: false
      t.boolean :worldview, default: false, null: false
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
