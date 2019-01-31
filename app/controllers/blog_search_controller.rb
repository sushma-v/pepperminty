class BlogSearchController < ApplicationController
  def index
    query = params.fetch(:tag, 'not_found') == 'not_found' ? params.fetch(:query, '') : params.fetch(:tag, '')
    @posts = Post.joins(:hash_tags).where(hash_tags: {name: query.delete('#')})
  end
end
