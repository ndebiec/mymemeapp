# frozen_string_literal: true

class Meme < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags
  mount_uploader :picture, PictureUploader
  validate :picture_size

  after_create do
    extract_tags
  end

  before_update do
    tags.clear
    extract_tags
  end

  def self.search(meme)
    if meme
      where('caption LIKE ?', "%#{meme}%").order('id DESC')
    else
      order('id DESC')
    end
  end

  private

  def picture_size
    if picture.size > 2.megabytes
      errors.add(:picture, 'File size cannot be greater than 2MB')
    end
  end

  def extract_tags
    hashtags = self.hashtags.scan(/#\w+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      tags << tag
    end
  end

end
