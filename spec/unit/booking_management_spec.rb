require "booking_management"

describe BookingManagement do
  describe "#.request" do
    let(:booking_double) { double :booking, space_id: space, guest_id: user, stay_date: "2020-01-20", booking_id: nil }
    it "adds a booking to the database" do
      user = add_test_user()
      space = add_test_space(user)
      booking = BookingManagement.request(Booking.new(space, user, "2020-01-20"))
      expect(booking.booking_id).not_to be nil
    end

    describe "#.confirm_booking" do
      it "allows the owner of a space to confirm a booking" do
        user = add_test_user()
        space = add_test_space(user)
        booking = BookingManagement.request(Booking.new(space, user, "2020-09-20"))
        confirmed_booking = BookingManagement.confirm_booking(booking, true)
        expect(confirmed_booking.confirmed).to be_truthy
      end
    end
  end
end
