class User
  attr_reader :email, :name, :password, :id

  def initialize(email, name, password, id = nil)
    @email = email
    @name = name
    @password = password
    @id = id
  end
end
