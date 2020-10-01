require "pg"
require_relative "./space"
require "date"

class SpaceManager
  def self.all
    result = DatabaseConnection.query("SELECT * FROM spaces;")
    result.map { |space| Space.new(space["name"], space["price"], space["description"], space["id"], space["userid"]) }
  end

  def self.availability(space, month)
    month_array = [Date.new(month.year, month.month, 1)]

    until (month_array.last + 1).month != month.month
      month_array << (month_array.last + 1)
    end

    result = DatabaseConnection.query("SELECT stay_date FROM bookings WHERE spaceid = $1 AND date_trunc('month', stay_date) = $2;", [space, month.strftime("%F")])

    result.each { |stay_date_hash|
      stay_date = Date.strptime(stay_date_hash["stay_date"], "%Y-%m-%d")
      month_array.delete(stay_date)
    }
    return month_array
  end

  # 2001-01-01 00:00:00

  def self.create(space_object)
    result = DatabaseConnection.query("INSERT INTO spaces (name, description, price, userid) VALUES ($1, $2, $3, $4) RETURNING id, name, description, price, userid;", [space_object.name, space_object.description, space_object.price, space_object.user_id])
    Space.new(result[0]["name"], result[0]["price"], result[0]["description"], result[0]["id"], result[0]["userid"])
  end

  def self.user_spaces(user_id)
    result = DatabaseConnection.query("SELECT * FROM spaces WHERE userid = $1;", [user_id])
    result.map { |space| Space.new(space["name"], space["price"], space["description"], space["id"], space["userid"]) }
  end
end
