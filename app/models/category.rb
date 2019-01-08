class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25}
  validates_uniquness_of :name
end