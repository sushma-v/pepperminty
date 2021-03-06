class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
    @category = Category.new
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_url, notice: 'Category was successfully created.'
    else
      render :index
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    if @category.update(category_params)
      redirect_to categories_url, notice: 'Category was successfully updated.'
    else
      render :index
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    begin
      @category.destroy
      redirect_to categories_url, notice: 'Category was successfully destroyed.'
    rescue StandardError => ex
      flash[:error] = ex.message
      redirect_to categories_url
    end
  end

  def inline_edit
    @category = Category.find(params[:id])
    respond_to do |format|
      format.js { render :file => "categories/inline_edit.js.erb", category: @category }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :display, :parent_id)
    end
end
