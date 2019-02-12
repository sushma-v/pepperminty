module CategoriesHelper
  def create_category(name, category="Root")
    visit categories_path

    page.fill_in 'category_name', with: name
    page.select category, :from => "category[parent_id]"
    page.check 'category_display'
    page.click_button 'Create Category'
  end
end