feature 'A user can list multiple spaces' do
  scenario 'user creates a few spaces and checks they are available' do
    visit("/")
    click_link("Login")
    fill_in(:email, with: "test@test.com")
    fill_in(:password, with: "password123")
    click_button("login")
    visit('/spaces')
    click_button('Add Space')
    fill_in('name', with: 'london flat')
    fill_in('price', with: '35')
    fill_in('description', with: 'a beautiful london flat in central london')
    click_button 'Create space'
    sleep(1)
    click_button('Add Space')
    fill_in('name', with: 'manchester flat')
    fill_in('price', with: '20')
    fill_in('description', with: 'a beautiful manchester flat in central manchester')
    click_button 'Create space'
    sleep(1)
    expect(page).to have_content 'london flat'
    expect(page).to have_content 'manchester flat'
  end
end