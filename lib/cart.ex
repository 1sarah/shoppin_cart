defmodule Cart do
  alias __MODULE__
  defstruct [:items]
  @items []
  def new() do
    @items
  end

  def add_items(item) do
    @items ++ item
  end
end
