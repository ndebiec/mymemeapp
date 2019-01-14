# frozen_string_literal: true

class Tag < ApplicationRecord
  has_and_belongs_to_many :memes
  validates :name, length: { minimum: 2, maximum: 22 }
end
