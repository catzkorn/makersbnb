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

def add_test_user(database = "makersbnb_test")
  connection = PG.connect(dbname: database)
  result = connection.exec("INSERT INTO users (email, name, password) VALUES ('test@test.com', 'Test McTestason', crypt('password123', gen_salt('bf') ), true) RETURNING id;")
  return result.values[0][0]
end
