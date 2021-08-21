class Plant

    attr_accessor :name, :description

    @@all = []

    def initialize(plant_hash)
        @name = plant_hash[:name]
        plant_hash = self
        @@all << self
    end

    def self.create_from_list(plants_array)
        plants_array.each do |plant|
            plant = self.new(plant)
        end
    end

    def plant_attributes(plant_page_hash)
        @description = plant_page_hash[:description]
    end

    def self.all
        @@all
    end
end

