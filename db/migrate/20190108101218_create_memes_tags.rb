class CreateMemesTags < ActiveRecord::Migration[5.2]
  def change
    create_table :memes_tags, :id=> false do |t|
      t.references :meme, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end
