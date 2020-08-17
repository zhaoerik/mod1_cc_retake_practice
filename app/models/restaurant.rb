class Restaurant
    
    attr_accessor :name, :star_rating, :owner
    @@all = []

    def initialize(owner, name, star_rating)
        @owner = owner
        @name = name
        @star_rating = star_rating
        @@all << self
    end

    def self.all
        @@all
    end
    
    def menu_items
        MenuItem.all.filter { |item| item.restaurant == self}
    end

    def recipes
        MenuItem.all.filter do |item| 
            item.restaurant == self
            item.recipe
        end
    end

    def has_dish?(recipe)
        Recipe.menu_items.include?(recipe)
    end

    def self.highest_rated
        rating = []
        self.all.filter do |restaurants| 
            rating << restaurants.star_rating
        end
        rating.max
    end

end

