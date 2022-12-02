defmodule OfferTest do
  use ExUnit.Case

  test "Till.sub_total/1 calculate total cost" do
    cart = ["VOUCHER", "TSHIRT", "VOUCHER"]
    cart_2 = ["VOUCHER", "TSHIRT", "VOUCHER", "VOUCHER", "MUG", "TSHIRT", "TSHIRT"]
    assert Till.sub_total(cart) == 25
    assert Till.sub_total(cart_2) == 74.50
  end

  test "Till.sub_total/1 calculate total cost with an invalid item " do
    items = ["INVALID_VOUCHER"]

    assert Till.sub_total(items) == 0
  end
end
