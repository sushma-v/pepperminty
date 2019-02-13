module PostsHelper
  def create_post
    signup('test@example.com', 'abcd1234')

    create_category('sales', category="Root")
    @category = Category.first

    visit posts_path
    page.click_link 'Create Post'
    page.fill_in 'post_title', with: 'Post1'
    page.fill_in 'post_content', with: 'Lorem Ipsum #best'
    page.fill_in 'post_alt_text', with: 'post1 alt text'
    page.fill_in 'post_meta_description', with: 'post1 meta description'
    page.fill_in 'post_meta_keywords', with: 'post1 meta keywords'
    page.select @category.name, :from => "post[category_id]"
    page.select "published", :from => "post[status]"
    page.click_button 'Create Post'

    expect(page).to have_content "Post was successfully created."
    signout

  end
end