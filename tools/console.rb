# require and load the environment file
require_relative '../config/environment.rb'

# call this method to reload your models as you write code
def reload
  load 'config/environment.rb'
end


recipe1 = Recipe.new("recipe1", "black")
recipe2 = Recipe.new("recipe2", "white")

erik = RestaurantOwner.new("erik", 42)
tommy = RestaurantOwner.new("tommy", 21)

rest1 = Restaurant.new(erik, "rest1", 5)
rest2 = Restaurant.new(tommy, "rest2", 4)

tomyum = MenuItem.new(rest1, recipe1, 20)
hotdog = MenuItem.new(rest2, recipe2, 10)


# ===== WARNING! DO NOT EDIT BELOW THIS LINE ===== #
binding.pry
0
