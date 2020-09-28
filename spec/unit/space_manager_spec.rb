require 'space_manager'
require 'space'

RSpec.describe SpaceManager do 

  describe '.create' do 
    it 'creates new space with Space class passed in as parameter' do 
      space = Space.new("Test", "90.00", "Test listing")
      space1 = Space.new("Test2", "00.00", "Test2 listing") 
      SpaceManager.create(space)
      SpaceManager.create(space1)
      expect(SpaceManager.all.length).to eq 2
    end 
  end

end 