require "./lib/database_connection"
def whichdb
  if ENV["ENVIRONMENT"] == "test"
    DatabaseConnection.setup("makersbnb_test")
  else
    DatabaseConnection.setup("makersbnb")
  end
end 
