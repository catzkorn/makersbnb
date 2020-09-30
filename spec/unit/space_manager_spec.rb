require "space_manager"
require "space"

describe SpaceManager do
  let(:space_double) { double :space, name: "london flat", price: "35", description: "a beautiful flat in central london lol", date: ["2020-01-01", "2020-01-02"], space_id: nil, user_id: nil }

  let(:space_double_two) { double :space, name: "manchester flat", price: "30", description: "a cottage in the outskirt", date: ["2020-01-01", "2020-01-02"], space_id: nil, user_id: nil }

  describe "#.create" do
    it "creates new space with Space class passed in as parameter" do
      space = SpaceManager.create(space_double)
      expect(space.name).to eq "london flat"
      expect(space.price).to eq "$35.00"
      expect(space.description).to eq "a beautiful flat in central london lol"
      expect(space.date).to eq ["2020-01-01", "2020-01-02"]
    end
  end

  describe "#.all" do
    it "returns a list of all the spaces" do
      SpaceManager.create(space_double)
      SpaceManager.create(space_double_two)
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
