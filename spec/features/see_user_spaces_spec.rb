feature "user can see their own spaces" do
  scenario "user clicks button to see their own spaces" do
    user = add_test_user()
    add_test_space(user)
    visit("/")
    click_button("Login")
    fill_in(:email, with: "test@test.com")
    fill_in(:password, with: "password123")
    click_button("login")
    visit("/spaces")
    click_link("View My Spaces")
  end
end
