json.extract! post, :id, :title, :content, :thumb_image, :main_image, :category, :author, :status, :created_at, :updated_at
json.url post_url(post, format: :json)
