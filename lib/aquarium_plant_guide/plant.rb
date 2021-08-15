class Plant

    attr_accessor :name

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

    def self.all
        @@all
    end
end

