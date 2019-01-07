class Meme < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validate :picture_size
  
  private
  def picture_size
    if picture.size > 2.megabytes
      errors.add(:picture, "File size cannot be greater than 2MB")
    end
  end
end
