feature 'Categories page' do

  scenario 'Visit the categories page', js: true do
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
    expect(page).to have_content 'sales'

    #cancel edit
    within('.tab-content') do
      page.all('a')[0].click
    end
    within('.edit-row') do
      page.fill_in 'category_name', with: 'marketing'
      page.click_button 'Cancel'
    end
    expect(page).to have_content 'sales'
    expect(page).not_to have_content 'marketing'

    #edit
    within('.tab-content') do
      page.all('a')[0].click
    end
    within('.edit-row') do
      page.fill_in 'category_name', with: 'marketing'
      page.uncheck 'category_display'
      page.click_button 'Update Category'
    end
    expect(page).to have_content 'Category was successfully updated.'
    expect(page).to have_content 'marketing'
    expect(page).not_to have_content 'sales'

    #cancel delete
    within('.tab-content') do
      page.all('a')[1].click
    end
    page.driver.browser.switch_to.alert.dismiss
    expect(page).not_to have_content 'Category was successfully destroyed.'
    expect(page).to have_content 'marketing'

    #delete
    within('.tab-content') do
      page.all('a')[1].click
    end
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content 'Category was successfully destroyed.'
    expect(page).not_to have_content 'marketing'

  end

end
