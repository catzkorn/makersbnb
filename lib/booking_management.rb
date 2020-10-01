require "pg"
require_relative "./booking"

class BookingManagement
  def self.request(booking)
    result = DatabaseConnection.query("INSERT INTO bookings (spaceid, guestid, stay_date, confirmation) VALUES ($1, $2, $3, $4) RETURNING *;", [booking.space_id, booking.guest_id, booking.stay_date, booking.confirmed])

    Booking.new(result[0]["spaceid"], result[0]["guestid"], result[0]["stay_date"], result[0]["confirmed"], result[0]["bookingid"])
  end
end
