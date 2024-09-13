require "test_helper"

class MarketTest < ActiveSupport::TestCase
  def setup
    @market = Market.new(name: "YanisShop")
  end

  test "should be valid" do
    assert @market.valid?
  end

  test "name should be present" do
    @market.name = nil
    assert_not @market.valid?
    assert_includes @market.errors[:name], "can't be blank"
  end

  test "name should be unique" do
    duplicate_market = @market.dup
    @market.save
    assert_not duplicate_market.valid?
    assert_includes duplicate_market.errors[:name], "has already been taken"
  end
end
