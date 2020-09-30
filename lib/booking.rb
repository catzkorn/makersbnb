class Booking
  attr_reader :space_id, :guest_id, :stay_date, :booking_id

  def initialize(space_id, guest_id, stay_date, booking_id = nil)
    @space_id = space_id
    @guest_id = guest_id
    @stay_date = stay_date
    @booking_id = booking_id
  end
end
