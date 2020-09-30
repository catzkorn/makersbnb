feature 'log_in' do 
  scenario 'user can login to use site' do 
    visit('/')
    click_on("Login")
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'password')
    click_on("login")
    expect(page).to have_content("List of all spaces!")
  end 
end 