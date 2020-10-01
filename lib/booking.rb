class Booking
  attr_reader :space_id, :guest_id, :stay_date, :booking_id, :confirmed
  require "date"

  def initialize(space_id, guest_id, stay_date, confirmed = false, booking_id = nil)
    @space_id = space_id
    @guest_id = guest_id
    @stay_date = Date.strptime(stay_date, "%Y-%m-%d")
    @confirmed = confirmed
    @booking_id = booking_id
  end
end
