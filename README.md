# Horizon65

# Shoppping cart with discount exercise with Elixir

This is a programming exercise that creates a simple shopping cart program.

The concept:

* A `JSon configuration file` containing all sold items -- i call it shop.
    --Provides item names and costs and offers

* A `Cart` holds a user's items.
    --Can be empty or contain list of items
      What is contained in the cart is the list of items code

* A `Till` calculates the cost of a cart's items.
   --Evaluates each item discount according to the rules in the json configuration file

# How to Install and Run the Project

Clone this project from here: 
* From the app directory run 
  * mix deps.get
  * mix compile
* There are test to run them use:
  * mix test

# How to Use the Project
Run in iteractive mode:
  * ies -S mix
   Initialize your cart(contains items that one wants to buy)
   example: items = ["VOUCHER","VOUCHER"]
    your_cost = Till.sub_total(items)
     amount should be 5.0


    




