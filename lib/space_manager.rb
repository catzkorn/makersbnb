require "pg"
require_relative "./space"

class SpaceManager
  def self.all
    result = DatabaseConnection.query("SELECT * FROM spaces;")
    result.map { |space| Space.new(space["name"], space["price"], space["description"], space["id"], space["userid"]) }
  end

  def self.create(space_object)
    result = DatabaseConnection.query("INSERT INTO spaces (name, description, price, userid, date_availability) VALUES ($1, $2, $3, $4, '{'$5'}') RETURNING id, name, description, price, date_availability, userid;", [space_object.name, space_object.description, space_object.price, space_object.user_id, space_object.date])
    date_availability = result[0]["date_availability"]
    Space.new(result[0]["name"], result[0]["price"], result[0]["description"], date_availability.gsub(/[{}]/, "").split(","), result[0]["id"], result[0]["userid"])
  end

  # #{space_object.date.join(",")}

  def self.user_spaces(user_id)
    result = DatabaseConnection.query("SELECT * FROM spaces WHERE userid = $1;", [user_id])
    result.map { |space| Space.new(space["name"], space["price"], space["description"], space["id"], space["userid"]) }
  end
end
