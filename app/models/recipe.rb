class Recipe

    @@all = []
    attr_reader :name
    attr_accessor :description

    def initialize(name, description)
        @name = name
        @description = description
        @@all << self
    end

    def self.all
        @@all
    end

    def menu_items
        MenuItem.all.filter { |item| item.recipe == self}
    end

    def restaurants
        # CARYN SAYS: make sure you're using your helper method! 
        # this is another instance as well of deciding which enumerable is most appropriate 
        MenuItem.all.select do |item|
            item.recipe == self
            item.restaurant
        end
    end
    # having trouble returning the restaurant instances

    def average_price
        prices = []
        # CARYN SAYS: same thing with the enumerable choice here
        # seems to me like you got comfortable with filter and are trying to use a hammer where a screwdriver would be a better tool, metaphorically 
        MenuItem.all.filter do |item| 
            item.recipe == self
            prices << item.price
        end
        prices.sum / prices.count
    end

    def highest_price
        prices = []
        # CARYN SAYS: yep, you have to stop with filter
        prices << MenuItem.all.filter { |item| item.recipe == self}.max
    end

    def cheapest_restaurant
        cheap = []
        MenuItem.all.filter do |items| 
            items.recipe == self
            cheap << items.price
        end
        cheap.min 
    end

    def self.inactive
        # CARYN SAYS: not quite! we'll go over the logic after lunch 
        MenuItem.all.filter { |item| item.recipe != self}
    end

end