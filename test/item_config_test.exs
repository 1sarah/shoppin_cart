defmodule ItemConfigTest do
  use ExUnit.Case

  test "ItemConfig.new/1 creates a new items configuration" do
      itemsConfig = ItemConfig.new("test/fixtures/test_config.json")

      assert length(Map.keys(itemsConfig)) == 4

  end


end
