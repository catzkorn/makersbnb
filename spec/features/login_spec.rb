feature 'log_in' do 
  scenario 'user can login to use site' do 
    add_test_user
    visit('/')
    click_on("Login")
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'password123')
    click_on("login")
    expect(page).to have_content("List of all spaces!")
  end 

  scenario 'user cannot login with incorrect email' do
    add_test_user 
    visit('/')
    click_on("Login")
    fill_in('email', with: 'test@email.com')
    fill_in('password', with: 'password123')
    click_on("login")
    expect(page).to have_content("Incorrect email or password")
  end 

  scenario 'user cannot login with incorrect email' do 
    add_test_user
    visit('/')
    click_on("Login")
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'wrong_password')
    click_on("login")
    expect(page).to have_content("Incorrect email or password")
  end 

end 