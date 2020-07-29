require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/item"
require "./lib/vendor"

class VendorTest < Minitest::Test 
  def test_it_exists
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_instance_of Vendor, vendor
  end

  def test_it_has_attributes_and_starts_without_inventory
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_equal "Rocky Mountain Fresh", vendor.name
    expected = {}
    assert_equal expected, vendor.inventory
  end

  def test_it_can_check_stock_and_have_inventory
    vendor = Vendor.new("Rocky Mountain Fresh")

    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: '$0.50'})

    vendor.add_item(item1, 0)
# binding.pry
    
    assert_equal 0, vendor.check_stock(item1)

    vendor.stock(item1, 30)

    expected = {item1 => 30}
    assert_equal expected, vendor.inventory
    assert_equal 30, vendor.check_stock(item1)
    
    vendor.stock(item1, 25)

    assert_equal 55, vendor.check_stock(item1)
    
    vendor.stock(item2, 12)

    expected = {item1 => 55, item2 => 12}
    assert_equal expected, vendor.inventory
  end

end