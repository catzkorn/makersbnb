class Space
  attr_reader :name, :price, :description, :space_id, :user_id

  def initialize(name, price, description, user_id = nil, space_id = nil)
    @name = name
    @price = price
    @description = description
    @user_id = user_id
    @space_id = space_id
  end
end
