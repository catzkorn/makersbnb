class User
  attr_reader :email, :name, :password
  def initialize(email , name, password)
    @email = email
    @name = name
    @password = password
  end
end