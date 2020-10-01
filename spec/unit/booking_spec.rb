require "booking"

describe Booking do
  let(:space_double) { double :space, space_id: "testspace" }
  let(:user_double) { double :user, guest_id: "testuser" }

  let(:test) { Booking.new(space_double.space_id, user_double.guest_id, "2020-01-20") }

  describe "#.new" do
    it "tests if booking has space_id" do
      expect(test.space_id).to eq "testspace"
    end

    it "tests if booking has user_id" do
      expect(test.guest_id).to eq "testuser"
    end

    it "tests if booking has a date of stay" do
      expect(test.stay_date).to eq Date.new(2020, 1, 20)
    end
  end
end
