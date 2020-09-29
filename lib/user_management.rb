require_relative "./database_connection"

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
    user = get_user(email)
    p user
    return false if user == false 
    return false unless password_match?(email, password)
    User.new(user['email'], user['name'], user['password'], user['id'])
  end

  private 

  def self.get_user(email)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';") 
    false unless result.count == 1
    result[0]
  end 

  def self.password_match?(email, user_password)
   result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}' AND password = crypt('#{user_password}', password);")
    p result
    false unless result.count == 1 
  end 

end
