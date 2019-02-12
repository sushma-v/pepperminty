feature 'Posts page' do

  scenario 'Visit the posts page after login', js: true do
    #before{ @category = FactoryBot.create(:category) }

    signup("test@example.com", "abcd1234")

    create_category('sales')
    @category = Category.first

    visit posts_path
    expect(page).to have_title "Blog"

    #create
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

    expect(page).to have_link '#best'
    expect(page).to have_link(nil, href: '/blog_search/best')

    click_link '#best'
    expect(page).to have_content 'Search Results'
    expect(page).to have_content 'Post1'

    #edit
    visit posts_path
    within('.blog-container') do
      click_link 'Edit'
    end
    page.fill_in 'post_title', with: 'Post 1'
    page.click_button 'Update Post'
    expect(page).to have_content "Post was successfully updated."
    expect(page).to have_content 'Post 1'

    #cancel delete
    visit posts_path
    within('.blog-container') do
      click_link 'Delete'
    end
    page.driver.browser.switch_to.alert.dismiss
    expect(page).not_to have_content 'Post was successfully destroyed.'
    expect(page).to have_content 'Post 1'

    #delete
    visit posts_path
    within('.blog-container') do
      click_link 'Delete'
    end
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content 'Post was successfully destroyed.'
    expect(page).not_to have_content 'Post 1'

    #signout
    #signout
    #visit posts_path
    #expect(page).to have_title "Blog"

  end

  scenario 'Visit the posts page without logging in', js: true do
    #before{ @category = FactoryBot.create(:category) }

    #visit posts_path
    #expect(page).to have_title "Blog"



  end

end
