class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :publish_post]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /posts
  # GET /posts.json
  def index
    return @posts = Post.published.paginate(:page => params[:page]).order('id DESC') unless current_user
    @posts = Post.all.paginate(:page => params[:page]).order('id DESC')
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new1
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      @post.update_attribute(:published_date, DateTime.now) if @post.published?
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    Post.transaction do
      begin
        @post.update(post_params)
        @post.update_hash_tags
        @post.update_attribute(:published_date, DateTime.now) if @post.published?
        redirect_to @post, notice: 'Post was successfully updated.'
      rescue StandardError => ex
        flash[:error] = ex.message
        render :edit
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  def publish_post
    @post.published!
    redirect_to @post, notice: 'Post published!'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :main_image, :alt_text, :category_id, :meta_description, :meta_keywords, :author, :status)
    end
end
