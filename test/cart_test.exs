defmodule CartTest do
  use ExUnit.Case

  test "Cart.new/0 create a new cart" do
    cart = Cart.new()
    assert length(cart) == 0
  end

  test "Cart.add_items/1 add items to cart" do
    items = ["VOUCHER", "MUG"]
    cart = Cart.add_items(items)
    assert length(cart) == 2
  end
end
