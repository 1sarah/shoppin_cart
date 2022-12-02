defmodule ItemConfig do
  alias __MODULE__
  defstruct [:items]
  require Logger

  def new(path) do

      path
      |> File.read!()
      |> Poison.decode!()

      # IO.inspect(json)

#     items = Enum.map(json,  fn x ->

#       Enum.into(x, %Item{}) end)
# IO.inspect(items)
    # %ItemConfig{
    #   items: json
    # }
    # IO.inspect(items)
  end
end
