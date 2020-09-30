require "space_manager"
require "space"

describe SpaceManager do
  let(:test) { Space.new("london flat", "35", "a beautiful flat in central london lol", ["2020-01-01", "2020-01-02"]) }
  let(:test2) { Space.new("manchester flat", "30", "a cottage in the outskirt", ["2020-01-01", "2020-01-02"]) }
  describe "#.create" do
    it "creates new space with Space class passed in as parameter" do
      space = SpaceManager.create(test)
      expect(space.name).to eq "london flat"
      expect(space.price).to eq "$35.00"
      expect(space.description).to eq "a beautiful flat in central london lol"
      expect(space.date).to eq ["2020-01-01", "2020-01-02"]
    end
  end

  describe "#.all" do
    it "returns a list of all the spaces" do
      SpaceManager.create(test)
      SpaceManager.create(test2)
      list_spacemanager_all = SpaceManager.all
      expect(list_spacemanager_all[1].name).to eq "manchester flat"
    end
  end

  # describe '#.user_spaces' do
  #   it 'returns a list of all the spaces' do
  #     SpaceManager.create(test)
  #     SpaceManager.create(test2)
  #     list_spacemanager_all = SpaceManager.all
  #     expect(list_spacemanager_all[1].name).to eq 'manchester flat'
  #   end
  # end

end
