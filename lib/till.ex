defmodule Till do
  alias Code.LoadError
  alias __MODULE__

  require Logger

  def sub_total(items) do
    # get product rules
    config = ItemConfig.new("test/fixtures/test_config.json")
    # get the frequency of items in a cart
    item_freq = Enum.frequencies(items)
    Logger.debug(item_freq)

    # item_freq output (%{k="v"})

    sum =
      Enum.map(item_freq, fn {item, qty} ->
        # get the price of each item against the rules
        price = config["price"][item]
        # if price == nil, do:
        # raise ArgumentError, "Item '#{item}' not in config array"

        # check if item is present in the configuration rules
        case price do
          nil ->
            Logger.warn("Item #{item} price has not been set")
            0.00

          _ ->
            # check if a product is contained in a promotion
            if config["promotion"][item] && qty >= config["bulk_num"][item] do
              discount = config["varrying_discount"][item]

              {result, _binding} =
                Code.eval_string(config["promotion"][item], q: qty, p: price, d: discount)

              result

              # "VOUCHER": "t = (q * p) - d",
              # "TSHIRT": "t = q * (p - d)"
            else
              price * qty
            end
        end
      end)
      |> Enum.sum()


    Logger.debug("Sum is: #{sum}")
    sum
  end
end
