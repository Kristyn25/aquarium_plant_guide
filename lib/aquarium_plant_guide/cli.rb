class AquariumPlantGuide::CLI
    
    def start
        puts "welcome to the Aquarium Plant Guide"
        list_plants
        list_options
        exit_program
    end

    def list_plants
        puts "1. Red Dwarf Aquarium Lily"
        puts "2. Anubias nana petite"
    end

    def list_options
       while true
            puts "Enter the number of the plant you would like more info on, or type list to display plant list again, or type exit"
            input = gets.strip
                    
            if input == "1"
                puts "More info on Red Dwarf Aquarium Lily..."
            elsif input == "2"
                puts "More info on Anubias nana petite..."
            elsif input == "list"
                list_plants
            elsif input == "exit"
                exit_program
            else
                puts "I am not sure what you are looking for."
            end
        end
    end

    def exit_program
        puts "Good-bye"
        exit
    end

end
