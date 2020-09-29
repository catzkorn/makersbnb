require_relative "./database_connection"

class UserManagement
  def self.all
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "makersbnb_test")
    else
      connection = PG.connect(dbname: "makersbnb")
    end

    result = connection.exec("SELECT * FROM users;")

    result.map { |user|
      User.new(user.values[1], user.values[2], user.values[3], user.values[0])
    }
  end

  def self.sign_up(user)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "makersbnb_test")
    else
      connection = PG.connect(dbname: "makersbnb")
    end

    connection.exec(
      "INSERT INTO users (email, name, password) 
    VALUES ($1, $2, crypt($3, gen_salt('bf') ));",
      [user.email, user.name, user.password]
    )
  end
end
