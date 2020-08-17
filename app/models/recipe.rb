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
        MenuItem.all.select do |item|
            item.recipe == self
            item.restaurant
        end
    end
    # having trouble returning the restaurant instances

    def average_price
        prices = []
        MenuItem.all.filter do |item| 
            item.recipe == self
            prices << item.price
        end
        prices.sum / prices.count
    end

    def highest_price
        prices = []
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
        MenuItem.all.filter { |item| item.recipe != self}
    end

end