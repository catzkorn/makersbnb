require "space"

describe Space do
  let(:test) { Space.new("london flat", "35", "a beautiful flat in central london lol") }
  describe "#.new" do
    it "tests if a new space has a name attribute" do
      expect(test.name).to eq "london flat"
    end

    it "tests if a new space has a price attribute" do
      expect(test.price).to eq "35"
    end

    it "tests if a new space has a description attribute" do
      expect(test.description).to eq "a beautiful flat in central london lol"
    end
  end
end
