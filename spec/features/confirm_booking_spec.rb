feature "Confirm a booking" do
  scenario "A host can confirm a guests booking" do
    user = add_test_user()
    space = add_test_space(user)
    visit("/")
    click_button("Login")
    fill_in(:email, with: "test@test.com")
    fill_in(:password, with: "password123")
    click_button("login")
    click_link("View My Spaces")
    expect(page).to have_content("Pending Bookings")
    click_button("Accept Booking")
  end
end
