feature 'signup' do
  scenario 'a user goes on the website and signs up to access the website' do
    visit('/')
    fill_in('email', with: 'test@test.co.uk')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'test_name')
    click_button('Submit')
    expect(page).to have_content "Welcome test_name"
  end
end