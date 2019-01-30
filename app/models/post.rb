class Post < ApplicationRecord
  has_many :post_hash_tags
  has_many :hash_tags, through: :post_hash_tags

  enum status: [:draft, :published]

  validates :title, presence: true
  validates :content, presence: true

  mount_uploader :main_image, ImageUploader

  scope :published, -> { where(status: :published) }
end
