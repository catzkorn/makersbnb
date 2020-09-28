require 'pg'

class SpaceManager 

  def self.all 
    @connection = PG.connect(dbname: 'makersbnb_test') 
    result =  @connection.exec("SELECT * FROM spaces")
    result.map { |space| space }
  end 

  def self.create(space)
    @connection = PG.connect(dbname: 'makersbnb_test')
    @connection.exec("INSERT INTO spaces (name, description, price) VALUES ('#{space.name}', '#{space.description}', '#{space.price}') ")
  end 

end 