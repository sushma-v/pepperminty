class BlogSearchController < ApplicationController
  def index
    Rails.logger.info("======1======="+params.to_json)
    query = params[:query].start_with?('#') ? params[:query].gsub('#', '') : params[:query]
    @posts = Post.joins(:hash_tags).where(hash_tags: {name: query})
    #@posts = Post.where("content like ?", "%#{params[:query]}%") #search by desc
  end
end
