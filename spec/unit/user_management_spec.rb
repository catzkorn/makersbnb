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

  describe "#.log_in" do 
    it 'allows a user to log in with correct login credentials' do
      user = UserManagement.sign_up(test_user)
      authenticated_user = UserManagement.login('test@test.com', 'password123')
      expect(authenticated_user.email).to eq "test@test.com"
    end 
  end

end
