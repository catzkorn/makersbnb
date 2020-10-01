require "spec_helper.rb"
require "pg"

def clear_spaces_table(database = "makersbnb_test")
  connection = PG.connect(dbname: database)
  connection.exec("TRUNCATE TABLE spaces CASCADE")
end

def clear_users_table(database = "makersbnb_test")
  connection = PG.connect(dbname: database)
  connection.exec("TRUNCATE TABLE users CASCADE")
end

def add_test_user(database = "makersbnb_test")
  connection = PG.connect(dbname: database)
  result = connection.exec("INSERT INTO users (email, name, password) VALUES ('test@test.com', 'Test McTestason', crypt('password123', gen_salt('bf') )) RETURNING id;")
  return result.values[0][0]
end

def add_test_space(userid, database = "makersbnb_test")
  connection = PG.connect(dbname: database)
  result = connection.exec("INSERT INTO spaces (name, description, price, userid) VALUES ('Buckingham Palace', 'Live like Queenie', 20.00, '#{userid}') RETURNING id;")
  return result.values[0][0]
end

def add_test_space_true(userid, database = "makersbnb_test")
  connection = PG.connect(dbname: database)
  result = connection.exec("INSERT INTO spaces (name, description, price, userid) VALUES ('Frogmore Cottage', 'Live like Megs', 40.00, '#{userid}') RETURNING id;")
  return result.values[0][0]
end
