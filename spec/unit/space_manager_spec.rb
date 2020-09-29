require 'space_manager'
require 'space'

describe SpaceManager do 
  let(:test){Space.new('london flat', '35', 'a beautiful flat in central london lol')}
  let(:test2){Space.new('manchester flat' , '30', 'a cottage in the outskirt')}
  describe '#.create' do 
    it 'creates new space with Space class passed in as parameter' do 
      space = SpaceManager.create(test)
      expect(space.name).to eq 'london flat'
      expect(space.price).to eq '$35.00'
      expect(space.description).to eq 'a beautiful flat in central london lol'
      expect(space.user_id).to eq nil
      expect(space.space_id).to eq nil
    end 
  end

  describe '#.all' do
    it 'returns a list of all the spaces' do
      SpaceManager.create(test)
      SpaceManager.create(test2)
      list_spacemanager_all = SpaceManager.all
      expect(list_spacemanager_all[1].name).to eq 'manchester flat'     
    end
  end

end 