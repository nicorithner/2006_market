require "minitest/autorun"
require "minitest/pride"
require "pry"
require "./lib/item"

class VendorTest < Minitest::Test 
  def test_it_exists
    vendor = Vendor.new

    assert_instance_of Vendor, vendor
  end

  def test_it_has_attributes

    assert_equal ,
  end

end