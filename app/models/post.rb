class Post < ApplicationRecord
  enum status: [:draft, :published]

  validates :title, presence: true
  validates :content, presence: true

  mount_uploader :main_image, ImageUploader
end
