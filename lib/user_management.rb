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
    result = DatabaseConnection.query(
        "INSERT INTO users (email, name, password) 
      VALUES ($1, $2, crypt($3, gen_salt('bf') )) RETURNING *;", [user.email, user.name, user.password]
      )
      User.new(result[0]["email"], result[0]["name"], result[0]["password"], result[0]["id"])
  end

  def self.login(email, password)
    data = UserManagement.password_match?(email, password)
    if data == false 
      return false
    else 
    User.new(data["email"], data["name"], data["password"], data["id"])
    end 
  end

  def self.password_match?(email, user_password)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = $1 AND password = crypt($2, password);", [email, user_password])
    result.count == 1 ? result[0] : false
  end

  def self.user_exists?(email)
      result = DatabaseConnection.query("SELECT * FROM users WHERE email = $1;", [email])
      result.count == 1 ? true : false  
  end 

end
