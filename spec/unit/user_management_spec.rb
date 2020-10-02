require "user_management"

describe UserManagement do
  let(:user_double) { double :user, email: "test@test.com", name: "test_name", password: "password123" }
  describe "#.sign_up" do
    it "stores a new user on the DB" do
      user = UserManagement.sign_up(user_double)
      expect(user.email).to eq "test@test.com"
      expect(user.name).to eq "test_name"
    end
  end

  describe "#.log_in" do
    it "allows a user to log in with correct login credentials" do
      user = UserManagement.sign_up(user_double)
      authenticated_user = UserManagement.login("test@test.com", "password123")
      expect(authenticated_user.email).to eq "test@test.com"
    end
    it "does not allow user to login with incorrect password" do
      user = UserManagement.sign_up(user_double)
      authenticated_user = UserManagement.login("test@test.com", "password23")
      expect(authenticated_user).to eq false
    end

    it "does not allow user to login with incorrect email" do
      user = UserManagement.sign_up(user_double)
      authenticated_user = UserManagement.login("test@tst.com", "password123")
      expect(authenticated_user).to eq false
    end

  end
end
