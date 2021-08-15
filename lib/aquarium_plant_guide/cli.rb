require_relative "../lib/aquarium_plant_guide/scraper.rb"
require_relative "../lib/aquarium_plant_guide/plant.rb"
require 'nokogiri'

class AquariumPlantGuide::CLI
    Base_Path = "https://www.aquariumcoop.com/collections/live-plants"

    def start
        puts "welcome to the Aquarium Plant Guide"
        list_plants
        list_options
        exit_program
    end

    def list_plants
        plants_array = Scraper.scrape_list_page(Base_Path + 'list.html')
        Plant.create_from_list(plants_array)
        #puts "1."
        #puts "2. Anubias nana petite"
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
