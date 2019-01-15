# frozen_string_literal: true

class Meme < ApplicationRecord
  # Relations
  belongs_to :user
  has_and_belongs_to_many :tags
  # Validation
  validate :picture_size
  validates :picture, presence: true

  attr_accessor :hashtags

  mount_uploader :picture, PictureUploader

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

  def extracted_hashtags
    tags.pluck(:name).map{ |x| '#' + x }.join(' ')
  end

  def extract_tags
    hashtags.scan(/#\w+/).uniq.each do |hashtag|
      tags.find_or_create_by(name: hashtag.downcase.delete('#'))
    end
  end

  private

  def picture_size
    if picture.size > 2.megabytes
      errors.add(:picture, 'File size cannot be greater than 2MB')
    end
  end

end
