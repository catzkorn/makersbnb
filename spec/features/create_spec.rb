feature "Creates a new space" do #first feature test pretending login does not exist
  scenario "User creates a new space with name, price and description" do
    user = add_test_user()
    visit("/")
    click_on("Login")
    fill_in("email", with: "test@test.com")
    fill_in("password", with: "password123")
    click_on("login")
    click_link("Add Space")
    fill_in("name", with: "london flat")
    fill_in("price", with: "35")
    fill_in("description", with: "a beautiful london flat in central london lol")
    click_button "Create space"
    sleep(1)
    expect(page).to have_content("london flat")
  end
end
