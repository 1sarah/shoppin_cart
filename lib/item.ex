defmodule Item do
  defstruct [:code, :name, :price]

  def new(code, name, price) do
    %Item{
      code: code,
      name: name,
      price: price
    }
  end
end
