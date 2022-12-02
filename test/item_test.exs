defmodule ItemTest do
  use ExUnit.Case

  test "Item.new/0 creates new item" do
    item = Item.new("some code", "some name", 42.0)

    assert item.code == "some code"
    assert item.name == "some name"
    assert item.price == 42.0

  end
end
