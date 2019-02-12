feature 'Posts page' do

  scenario 'Visit the posts page after login', js: true do
    #before{
    #  FactoryBot.create(:categories, :display)
    #}

    signup("test@example.com", "abcd1234")

    visit posts_path
    expect(page).to have_title "Blog"

    #create
    page.click_link 'Create Post'
    page.fill_in 'post_title', with: 'Post1'
    page.fill_in 'post_content', with: 'Lorem Ipsum'
    page.fill_in 'post_alt_text', with: 'post1 alt text'
    page.fill_in 'post_meta_description', with: 'post1 meta description'
    page.fill_in 'post_meta_keywords', with: 'post1 meta keywords'
    page.select "sales", :from => "post[category_id]"
    page.select "published", :from => "post[status]"
    page.click_button 'Create Post'

    expect(page).to have_content "Post was successfully created."

    #cancel edit

    #edit

    #cancel delete

    #delete

  end

end
