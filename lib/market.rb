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

  def sorted_item_list
    list = @vendors.flat_map do |vendor|
      vendor.inventory.keys.find_all do |item|
        vendor.check_stock(item)
      end
    end.uniq
    list.map do |item|
      item.name
    end.sort
  end

end