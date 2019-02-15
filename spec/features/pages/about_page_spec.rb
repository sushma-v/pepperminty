feature 'About page' do

  scenario 'Visit the services page' do
    visit about_path
    expect(page).to have_content 'Our Aim'
  end

end
