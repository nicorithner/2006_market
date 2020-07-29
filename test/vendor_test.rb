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

end