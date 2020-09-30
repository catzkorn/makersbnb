feature 'User can logout' do
  scenario 'User logs out and is redirected to main page'  do
    add_test_user
    visit('/')
    click_on("Login")
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'password123')
    click_on("login")
    click_on('logout')
    expect(page).not_to have_content ''
    expect(page).to have_content "You're logged out"

  end
end