module SignupHelper
  def signup(email, password)
    visit new_user_registration_path
    page.fill_in 'user_email', with: email
    page.fill_in 'user_password', with: password
    page.fill_in 'user_password_confirmation', with: password
    page.click_button "Sign up"
  end

  def signin(email, password)
    visit new_user_session_path
    page.fill_in 'user_email', with: email
    page.fill_in 'user_password', with: password
    page.click_button "Sign In"
  end

  def signout
    page.click_button "Sign out"
  end
end