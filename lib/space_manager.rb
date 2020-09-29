require 'pg'
require_relative './space'

class SpaceManager 

  def self.all 
    @connection = PG.connect(dbname: 'makersbnb_test') 
    result =  @connection.exec("SELECT * FROM spaces;")
    result.map { |space| Space.new(space['name'], space['price'], space['description'], space['space_id'], space['user_id']) }
  end 

  def self.create(space_object)
    @connection = PG.connect(dbname: 'makersbnb_test')
    result = @connection.exec("INSERT INTO spaces (name, description, price) VALUES ('#{space_object.name}', '#{space_object.description}', '#{space_object.price}') RETURNING id, name, description, price; ")
    Space.new(result[0]['name'], result[0]['price'], result[0]['description'], result[0]['space_id'], result[0]['user_id'])
  end 

  # Use this when we have user class with ids
  # def self.create(space_object)
  #   @connection = PG.connect(dbname: 'makersbnb_test')
  #   result = @connection.exec("INSERT INTO spaces (name, description, price, userid) VALUES ('#{space_object.name}', '#{space_object.description}', '#{space_object.price}', '#{space_object.user_id}') RETURNING id, name, description, price, userid; ")
  #   Space.new(result[0]['name'], result[0]['price'], result[0]['description'], result[0]['space_id'], result[0]['user_id'])
  # end 

end 