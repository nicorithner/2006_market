class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map {|vendor| vendor.name }
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor| 
      vendor.inventory.include?(item)
    end
  end

  def items_list
    @vendors.flat_map do |vendor|
    vendor.inventory.keys.find_all do |item|
      vendor.check_stock(item)
      end
    end.uniq
  end

  def sorted_item_list
    items_list.map do |item|
      item.name
    end.sort
  end

  def total_inventory
    total = {}
    items_list.each do |item|
      vendors = vendors_that_sell(item)
      quantity = vendors.sum {|vendor| vendor.check_stock(item)}
      total[item] = {vendors: vendors, quantity: quantity}
    end
    total
  end

  def overstocked_items
    items_list.find_all do |item|
      vendors_that_sell(item).count > 1 &&
    total_inventory[item][:quantity] > 50
    end
  end

end