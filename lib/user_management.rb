require_relative "./database_connection"
require_relative "user"

class UserManagement
  def self.all
    result = DatabaseConnection.query("SELECT * FROM users;")
    result.map { |user|
      User.new(user.values[1], user.values[2], user.values[3], user.values[0])
    }
  end

  def self.sign_up(user)
    DatabaseConnection.query(
      "INSERT INTO users (email, name, password) 
    VALUES ($1, $2, crypt($3, gen_salt('bf') ));", [user.email, user.name, user.password]
    )
  end

  def self.login(email, password)
    data = UserManagement.password_match?(email, password)
    raise 'password doesn\'t match' if data == false
    User.new(data["email"], data["name"], data["password"], data["id"])
  end

  def self.password_match?(email, user_password)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = $1 AND password = crypt($2, password);", [email, user_password])
    result.count == 1 ? result[0] : false
  end
end
