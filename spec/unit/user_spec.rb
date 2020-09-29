require 'user'

describe User do
  describe '#.new' do 
    let(:test) {User.new('test@test.com', 'test_name', 'password123')}
    it 'returns the name of user' do
      expect(test.name).to eq "test_name" 
    end 

    it 'returns the email of user' do
      expect(test.email).to eq "test@test.com" 
    end

    it 'returns the password of user' do
      expect(test.password).to eq "password123" 
    end
    
  end 

end 