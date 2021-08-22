class Plant

    attr_accessor :name, :product_url, :description, :quick_info, :rating

    @@all = []

    def initialize(plant_hash)
        @name = plant_hash[:name]
        @product_url = plant_hash[:product_url]
        plant_hash = self
        @@all << self
    end

    def self.create_from_list(plants_array)
        plants_array.each do |plant|
            plant = self.new(plant)
        end
    end

    def plant_attributes(plant_attributes_array)
        @quick_info = plant_attributes_array[:quick_info]
        @description = plant_attributes_array[:description]
        @rating = plant_attributes_array[:rating]
    end

    def self.all
        @@all
    end
end

