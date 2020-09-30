feature "user can see their own spaces" do
  scenario "user clicks button to see their own spaces" do
    user = add_test_user()
    add_test_space(user)
    visit("/")
    click_link("Login")
    fill_in(:email, with: "test@test.com")
    fill_in(:password, with: "password123")
    click_button("login")
    visit("/spaces")
    click_button("View My Spaces")
    find("date-menu").click
    select "01-01-2020", from: 'date-menu'
  end
end
