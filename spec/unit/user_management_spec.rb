require "user_management"

describe UserManagement do
  let(:test_user) { double :user, email: "test@test.com", name: "test_name", password: "password123" }
  describe "#.sign_up" do
    it "stores a new user on the DB" do
      data = UserManagement.sign_up(test_user)
      expect(UserManagement.all[0].email).to eq "test@test.com"
      expect(UserManagement.all[0].name).to eq "test_name"
    end
  end
end
