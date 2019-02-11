feature 'Categories page' do

  scenario 'Visit the categories page' do
    visit categories_path
    expect(page).to have_content 'You need to sign in or sign up before continuing'

    signup("test@example.com", "abcd1234")

    visit categories_path
    expect(page).to have_content "Tree"

    #create
    page.fill_in 'category_name', with: 'sales'
    page.select "Root", :from => "category[parent_id]"
    page.check 'category_display'
    page.click_button 'Create Category'

    expect(page).to have_content 'Category was successfully created.'

    #edit
    #within('.tab-content') do
    #  page.all('a')[0].click
    #end
    #page.fill_in 'category_name', with: 'online sales'
    #page.click_button 'Update Category'
    #expect(page).to have_content 'Category was successfully updated.'

    #delete
    within('.tab-content') do
      page.all('a')[1].click
    end
    expect(page).to have_content 'Category was successfully destroyed.'

  end

end
