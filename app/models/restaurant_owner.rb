class RestaurantOwner

    @@all = []
    attr_accessor :name, :age

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def restaurants
        Restaurant.all.filter { |restaurants| restaurants.owner == self}
    end

    def menu_items
        MenuItem.all.filter do |items| 
            items.restaurant == self
        end
    end
    
    def self.average_age
        sum = []
        self.all.filter do |owners| 
            sum << owners.age
        end
        sum.sum / sum.count
    end

    def sell_restaurant(restaurant, buyer)
        if restaurant.owner == self
            restaurant.owner = buyer
        end
    end
end