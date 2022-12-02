defmodule Checkout do
  defstruct [:items, :total]

  def new do
    checkout = %Checkout{
      items: [],
      total: 0
    }
    checkout
  end

end
