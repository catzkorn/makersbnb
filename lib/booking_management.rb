require "pg"
require_relative "./booking"

class BookingManagement
  def self.request(booking)
    result = DatabaseConnection.query("INSERT INTO bookings (spaceid, guestid, stay_date) VALUES ($1, $2, $3) RETURNING *;", [booking.space_id, booking.guest_id, booking.stay_date])

    Booking.new(result[0]["spaceid"], result[0]["guestid"], result[0]["stay_date"], result[0]["confirmed"], result[0]["bookingid"])
  end

  def self.pending_bookings(userid)
    pending_bookings = []

    result = DatabaseConnection.query("SELECT bookings.*, users.*, users.name AS user_name, spaces.* FROM bookings LEFT JOIN spaces ON bookings.spaceid = spaces.id LEFT JOIN users ON bookings.guestid = users.id WHERE spaces.userid = $1 AND bookings.confirmation IS NULL;", [userid])

    result.each { |booking|
      pending_bookings << {
        "guest" => User.new(booking["email"], booking["user_name"]),
        "space" => Space.new(booking["name"], booking["price"], booking["description"], booking["userid"], booking["space_id"]),
        "booking" => Booking.new(booking["spaceid"], booking["guestid"], booking["stay_date"], booking["confirmation"] == "t", booking["bookingid"]),
      }
    }

    return pending_bookings
  end

  def self.confirm_booking(booking_id, confirmation)
    case confirmation
    when true
      result = DatabaseConnection.query("UPDATE bookings SET confirmation = $1 WHERE bookingid = $2 RETURNING *;", [confirmation, booking_id])

      Booking.new(result[0]["spaceid"], result[0]["guestid"], result[0]["stay_date"], result[0]["confirmation"], result[0]["bookingid"])
    when false

      #What do we want to happen here?
      result = DatabaseConnection.query("UPDATE bookings SET confirmation = $1 WHERE bookingid = $2 RETURNING *;", [confirmation, booking_id])

      return Booking.new(result[0]["spaceid"], result[0]["guestid"], result[0]["stay_date"], result[0]["confirmed"], result[0]["bookingid"])
    end
  end

  def self.user_bookings(userid)
    bookings = []

    result = DatabaseConnection.query("SELECT bookings.*, users.*, users.name AS user_name, spaces.* FROM bookings LEFT JOIN spaces ON bookings.spaceid = spaces.id LEFT JOIN users ON bookings.guestid = users.id WHERE spaces.userid = $1;", [userid])

    result.each { |booking|
      bookings << {
        "guest" => User.new(booking["email"], booking["user_name"]),
        "space" => Space.new(booking["name"], booking["price"], booking["description"], booking["userid"], booking["space_id"]),
        "booking" => Booking.new(booking["spaceid"], booking["guestid"], booking["stay_date"], booking["confirmation"], booking["bookingid"]),
      }
    }

    return bookings
  end
end
