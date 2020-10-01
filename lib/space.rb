class Space
  attr_reader :name, :price, :description, :space_id, :user_id

  def initialize(name, price, description, space_id = nil, user_id = nil)
    @name = name
    @price = price
    @description = description
    @space_id = space_id
    @user_id = user_id
  end
end
