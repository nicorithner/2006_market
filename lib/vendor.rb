class Vendor
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new{(0)}
  end
  def add_item(item, quantity)
    @inventory[item] = quantity
# {:quantity => quantity}
  end

  def stock(item, quantity)
    if  @inventory[item] == 0
      @inventory[item] = quantity
    else
      @inventory[item] += quantity
    end
# binding.pry
  end

  def check_stock(item)
    @inventory[item]
# [:quantity]
  end

end