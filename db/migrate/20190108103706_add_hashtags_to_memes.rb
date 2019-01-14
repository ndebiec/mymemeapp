# frozen_string_literal: true

class AddHashtagsToMemes < ActiveRecord::Migration[5.2]
  def change
    add_column :memes, :hashtags, :text
  end
end
