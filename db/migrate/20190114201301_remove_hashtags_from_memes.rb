class RemoveHashtagsFromMemes < ActiveRecord::Migration[5.2]
  def change
    remove_column :memes, :hashtags
  end
end
