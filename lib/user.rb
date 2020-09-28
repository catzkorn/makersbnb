class User
  attr_reader :email, :name, :password, :user_id
  def initialize(email , name, password, user_id = nil)
    @email = email
    @name = name
    @password = password
    @user_id = user_id
  end
end