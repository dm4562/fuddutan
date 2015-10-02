require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def setup
    @item = Item.new(type: "Electronics", title: "iPhone 5s", has_id: false,
      where_found: "Clough Undergraduate Learning Commons", when_found: Time.now, where_held: "Library", connected_lost_items: false,
      description: "Black iPhone with screen cracked at the top right corner. Batman wallpaper")
  end

  test "should be valid" do
    assert @item.valid?
  end

  test "type should be present" do
    @item.type = " "
    assert_not @item.valid?
  end

  test "title should be present" do
    @item.title = " "
    assert_not @item.valid?
  end

  test "title should not be too long" do
    @item.title = 'a' * 256
    assert_not @item.valid?
  end

  test "has_id should be present" do
    @item.has_id = " "
    assert_not @item.valid?
  end

  test "where_found should be present" do
    @item.where_found = " "
    assert_not @item.valid?
  end

  test "where_held should be present" do
    @item.where_held = " "
    assert_not @item.valid?
  end

  test "connected_lost_items should be present" do
    @item.connected_lost_items = " "
    assert_not @item.valid?
  end

  test "description should be present" do
    @item.description = " "
    assert_not @item.valid?
  end

  test "description should not be longer than 65536 characters" do
    @item.description = 'a' * 65537
    assert_not @item.valid?
  end
end
