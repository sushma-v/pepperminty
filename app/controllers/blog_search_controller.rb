class BlogSearchController < ApplicationController
  def index
    query = params.fetch(:tag, 'not_found') == 'not_found' ? params.fetch(:query, '') : params.fetch(:tag, '')
    @posts = Post.joins(:hash_tags).where(hash_tags: {name: query.delete('#')}).paginate(:page => params[:page]).order('id DESC')
  end

  def by_category
    keyword = params.fetch(:keyword, nil)
    category = Category.find(keyword)

    descendant_ids = category.descendant_ids
    descendant_ids << category.id

    @posts = Post.where(category_id: descendant_ids).paginate(:page => params[:page]).order('id DESC')
  end
end
