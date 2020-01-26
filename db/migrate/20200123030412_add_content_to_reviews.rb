class AddContentToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :content, :string
    add_column :reviews, :spoiler, :boolean, default: false, null: false
    add_column :reviews, :edited, :boolean, default: false, null: false
  end
end
