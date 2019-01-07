class CreateMemes < ActiveRecord::Migration[5.2]
  def change
    create_table :memes do |t|
      t.string :name
      t.string :picture
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
