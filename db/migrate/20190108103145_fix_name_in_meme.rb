class FixNameInMeme < ActiveRecord::Migration[5.2]
  def change   
    change_table :memes do |t|
      t.rename :name, :caption
    end
  end
end
