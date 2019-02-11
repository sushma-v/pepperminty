feature 'Categories page' do

  scenario 'Visit the categories page' do
    visit categories_path
    expect(page).to have_content 'You need to sign in or sign up before continuing'

    signup("test@example.com", "abcd1234")

  end

end
