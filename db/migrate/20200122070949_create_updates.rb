class CreateUpdates < ActiveRecord::Migration[5.2]
  def change
    create_table :updates do |t|
      t.date :update_day
      t.string :update_info
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
