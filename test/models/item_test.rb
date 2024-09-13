require "test_helper"

class ItemTest < ActiveSupport::TestCase
  def setup
    @item = Item.new(name: "Pomme", code: "P", price: 3.3)
  end

  test "should be valid" do
    assert @item.valid?
  end

  test "name should be present" do
    @item.name = nil
    assert_not @item.valid?
    assert_includes @item.errors[:name], "can't be blank"
  end

  test "code should be present" do
    @item.code = nil
    assert_not @item.valid?
    assert_includes @item.errors[:code], "can't be blank"
  end

  test "price should be present" do
    @item.price = nil
    assert_not @item.valid?
    assert_includes @item.errors[:price], "can't be blank"
  end

  test "name should be unique" do
    duplicate_item_name = @item.dup
    duplicate_item_name.code = "Q"
    @item.save
    assert_not duplicate_item_name.valid?
    assert_includes duplicate_item_name.errors[:name], "has already been taken"
  end

  test "code should be unique" do
    duplicate_item_code = @item.dup
    duplicate_item_code.name = "Banane"
    @item.save
    assert_not duplicate_item_code.valid?
    assert_includes duplicate_item_code.errors[:code], "has already been taken"
  end

  test "price should be greater than 0" do
    @item.price = 0
    assert_not @item.valid?
    assert_includes @item.errors[:price], "must be greater than 0"
  end
end
