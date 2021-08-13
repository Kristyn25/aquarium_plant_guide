class AquariumPlantGuide::CLI
    
    def start
        puts "welcome to the Aquarium Plant Guide"
        list_plants
        list_options
    end

    def list_plants
        puts "1. Red Dwarf Aquarium Lily"
        puts "2. Anubias nana petite"
    end

    def list_options
    puts "Enter the number of the plant you would like more info on or type exit"
        if input != 0
            input = gets.strip
        elsif "1"
            puts "More info on Red Dwarf Aquarium Lily..."
        elsif "2"
            puts "More info on Anubias nana petite..."
        else
            puts "I am not sure what you are looking for."
        end
    end
end
