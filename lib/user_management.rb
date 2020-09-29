require_relative "./database_connection"
require_relative 'user'

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
    VALUES ('#{user.email}', '#{user.name}', crypt('#{user.password}', gen_salt('bf') ));"
    )
  end

  def self.login(email, password)
    data = UserManagement.password_match?(email, password)
    raise 'password doesn\'t match' if data == false
    User.new(data['email'], data['name'], data['password'], data['id'])
  end

  # def self.get_user(email)
  #   result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';") 
  #   result.count == 1 ? result[0]: false
  # end 

  def self.password_match?(email, user_password)
   result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}' AND password = crypt('#{user_password}', password);")
   result.count == 1 ? result[0]: false
  end 

end
