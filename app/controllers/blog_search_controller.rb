class BlogSearchController < ApplicationController
  def index
    Rails.logger.info("======1======="+params.to_json)
    query = params.fetch(:query, '')
    @posts = Post.joins(:hash_tags).where(hash_tags: {name: query.delete('#')})
  end
end
