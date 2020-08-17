class MenuItem

    @@all = []
    attr_accessor :price, :restaurant
    attr_reader :recipe

    def initialize(restaurant, recipe, price)
        @restaurant = restaurant
        @recipe = recipe
        @price = price
        @@all << self
    end

    def self.all
        @@all
    end

    def self.most_expensive_item
        self.all.filter {|items| items.price}.max
    end
    
end