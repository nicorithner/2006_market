class Vendor
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new{(0)}
  end
  def add_item(item, quantity)
    @inventory[item] = quantity
  end

  def stock(item, quantity)
    if  @inventory[item] == 0
      @inventory[item] = quantity
    else
      @inventory[item] += quantity
    end

  end

  def check_stock(item)
    @inventory[item]
  end

  def potential_revenue
    total = @inventory.map do |item, quantity|
      item.price * quantity
    end
    total.sum
  end

end