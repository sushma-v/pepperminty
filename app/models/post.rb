class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  mount_uploader :main_image, ImageUploader
end
