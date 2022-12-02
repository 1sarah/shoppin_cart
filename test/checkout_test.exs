defmodule CheckoutTest do
  use ExUnit.Case

  test "Checkout.new/0 create a new checkout" do
    checkout = Checkout.new()

    assert length(checkout.items) == 0
    assert checkout.total == 0.0
  end
end
