class Meme < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags
  mount_uploader :picture, PictureUploader
  validate :picture_size

  after_create do
    hashtags=self.hashtags.scan(/#\w+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      self.tags << tag
    end
  end

  before_update do
    self.tags.clear
    hashtags=self.hashtags.scan(/#\w+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      self.tags << tag
    end
  end

  private
  def picture_size
    if picture.size > 2.megabytes
      errors.add(:picture, "File size cannot be greater than 2MB")
    end
  end
end
