defmodule Till do
  alias Code.LoadError
  alias __MODULE__

  require Logger

  def sub_total(items) do
    # get product rules from json file
    config = ItemConfig.new("test/fixtures/test_config.json")
    # get the frequency of items in a cart
    item_freq = Enum.frequencies(items)
    Logger.debug(item_freq)

    # item_freq output (%{k="v"})

    sum =
      Enum.map(item_freq, fn {item, qty} ->
        # get the price of each item against the rules
        price = config["price"][item]

        # check if item is present in the configuration rules if false return 0 and proceed with other calculations
        case price do
          nil ->
            Logger.warn("Item #{item} price has not been set")
            0.00

          _ ->
            # check if a product is contained in a promotion
            if config["promotion"][item] && qty >= config["bulk_num"][item] do
              discount = config["varrying_discount"][item]

              # "VOUCHER": "t = (q * p) - d",
              # "TSHIRT": "t = q * (p - d)"
              {result, _binding} =
                Code.eval_string(config["promotion"][item], q: qty, p: price, d: discount)

              result
            else
              price * qty
            end
        end
      end)
      |> Enum.sum()

    # convert to EURO
    # Money.to_string(Money.new(sum,:EUR),symbol: true)

    Logger.debug("Sum is: #{sum}")
    sum
  end
end
