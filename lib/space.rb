class Space

attr_reader :name, :price, :description, :date, :space_id, :user_id

  def initialize(name, price, description, date, space_id = nil, user_id = nil) 
    @name = name
    @price = price
    @description = description
    @date = date
    @space_id = space_id
    @user_id = user_id
  end 

end 