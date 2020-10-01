class Booking
  attr_reader :space_id, :guest_id, :stay_date, :booking_id
  require "date"

  def initialize(space_id, guest_id, stay_date, booking_id = nil)
    @space_id = space_id
    @guest_id = guest_id
    @stay_date = Date.strptime(stay_date, "%Y-%m-%d")
    @booking_id = booking_id
  end
end
