class Post < ApplicationRecord
  has_many :post_hash_tags
  has_many :hash_tags, through: :post_hash_tags

  enum status: [:draft, :published]

  validates :title, presence: true
  validates :content, presence: true

  after_commit :create_hash_tags, on: :create

  mount_uploader :main_image, ImageUploader

  scope :published, -> { where(status: :published) }

  def create_hash_tags
    extract_hash_tags.each do |name|
      hash_tags.find_or_create_by(name: name)
    end
  end

  def extract_hash_tags
    edited_content = content.gsub("&#", "")
    edited_content.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}
  end
end
