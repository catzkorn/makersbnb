require "pg"
require_relative "./space"
require "date"

class SpaceManager
  def self.all
    result = DatabaseConnection.query("SELECT * FROM spaces;")
    result.map { |space| Space.new(space["name"], space["price"], space["description"], space["userid"], space["id"]) }
  end

  def self.availability(space, month)
    month_array = [Date.new(month.year, month.month, 1)]

    until (month_array.last + 1).month != month.month
      month_array << (month_array.last + 1)
    end

    result = DatabaseConnection.query("SELECT stay_date FROM bookings WHERE spaceid = $1 AND date_trunc('month', stay_date) = $2 AND confirmation = true;", [space, month.strftime("%F")])

    result.each { |stay_date_hash|
      stay_date = Date.strptime(stay_date_hash["stay_date"], "%Y-%m-%d")
      month_array.delete(stay_date)
    }
    return month_array
  end

  # 2001-01-01 00:00:00

  def self.create(space_object)
    result = DatabaseConnection.query("INSERT INTO spaces (name, description, price, userid) VALUES ($1, $2, $3, $4) RETURNING id, name, description, price, userid;", [space_object.name, space_object.description, space_object.price, space_object.user_id])
    Space.new(result[0]["name"], result[0]["price"], result[0]["description"], result[0]["userid"], result[0]["id"])
  end

  def self.user_spaces(user_id)
    result = DatabaseConnection.query("SELECT * FROM spaces WHERE userid = $1;", [user_id])
    result.map { |space| Space.new(space["name"], space["price"], space["description"], space["userid"], space["id"]) }
  end

  def self.view_space(space_id)
    result = DatabaseConnection.query("SELECT * FROM spaces WHERE id = $1;", [space_id])
    Space.new(result[0]["name"], result[0]["price"], result[0]["description"], result[0]["userid"], result[0]["id"])
  end

  def self.month_conversion(month)
    case month
    when "january"
      Date.new(2020, 1)
    when "february"
      Date.new(2020, 2)
    when "march"
      Date.new(2020, 3)
    when "april"
      Date.new(2020, 4)
    when "may"
      Date.new(2020, 5)
    when "june"
      Date.new(2020, 6)
    when "july"
      Date.new(2020, 7)
    when "august"
      Date.new(2020, 8)
    when "september"
      Date.new(2020, 9)
    when "october"
      Date.new(2020, 10)
    when "november"
      Date.new(2020, 11)
    when "december"
      Date.new(2020, 12)
    end
  end
end
