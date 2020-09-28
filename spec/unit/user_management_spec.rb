require 'user_management'

describe UserManagement do 
  let(:test_user) {double :user, email: 'test@test.com', name: 'test_name', password: 'password123' }
  describe '#.sign_up' do
    it 'stores a new user on the DB' do
      data = UserManagement.sign_up(test_user)
      expect(data.name).to 'test_name'
      expect(data.email).to 'email'
    end 
  end 

end 