require "pg"
require_relative "./booking"

class BookingManagement
  def self.request(booking)
    result = DatabaseConnection.query("INSERT INTO bookings (spaceid, guestid, stay_date, confirmation) VALUES ($1, $2, $3, $4) RETURNING *;", [booking.space_id, booking.guest_id, booking.stay_date, booking.confirmed])

    Booking.new(result[0]["spaceid"], result[0]["guestid"], result[0]["stay_date"], result[0]["confirmed"], result[0]["bookingid"])
  end

  def self.confirm_booking(booking, confirmation)
    case confirmation
    when true
      result = DatabaseConnection.query("UPDATE bookings SET confirmation = $1 WHERE bookingid = $2 RETURNING *;", [confirmation, booking.booking_id])

      Booking.new(result[0]["spaceid"], result[0]["guestid"], result[0]["stay_date"], result[0]["confirmation"], result[0]["bookingid"])
    when false

      #What do we want to happen here?
      result = DatabaseConnection.query("INSERT INTO bookings (confirmation) VALUES ($1) WHERE bookingid = $2 RETURNING *;", [confirmation, booking.booking_id])

      return Booking.new(result[0]["spaceid"], result[0]["guestid"], result[0]["stay_date"], result[0]["confirmed"], result[0]["bookingid"])
    end
  end
end
