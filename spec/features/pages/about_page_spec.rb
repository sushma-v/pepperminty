# Feature: 'About' page
#   As a visitor
#   I want to visit an 'services' page
#   So I can learn more services the website
feature 'About page' do

  # Scenario: Visit the 'services' page
  #   Given I am a visitor
  #   When I visit the 'services' page
  #   Then I see "About the Website"
  scenario 'Visit the services page' do
    visit about_path
    expect(page).to have_content 'Our Aim'
  end

end
