require "spec_helper.rb"
require "pg"

def clear_spaces_table(database = "makersbnb_test")
  connection = PG.connect(dbname: database)
  connection.exec("TRUNCATE TABLE spaces")
end

def clear_users_table(database = "makersbnb_test")
  connection = PG.connect(dbname: database)
  connection.exec("TRUNCATE TABLE users CASCADE")
end
