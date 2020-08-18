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
            items.restaurant == self # CARYN SAYS: you're inside of RestaurantOwner, so self will be an instance of RestaurantOwner
        end
        # CARYN SAYS: use your restaurants helper method. Once you have an array of all the restaurants, you can grab each Restaurant's menu items 
    end
    
    def self.average_age
        sum = []
        # CARYN SAYS: think about which enumberable suits the behavior. Filter isn't necessary here
        #  - we don't need a new array that only includes some of the elements of the array
        self.all.filter do |owners| 
            sum << owners.age
        end
        sum.sum / sum.count
    end

    def sell_restaurant(restaurant, buyer)
        # CARYN SAYS: easy! nice! 
        if restaurant.owner == self
            restaurant.owner = buyer
        end
    end
end