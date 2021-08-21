require_relative "scraper.rb"
require_relative "plant.rb"
require 'nokogiri'

class CLI #AquariumPlantGuide::CLI
    Base_Path = "https://www.aquariumcoop.com/collections/live-plants"

    def start
        puts "welcome to the Aquarium Plant Guide"
        list_plants
        plant_attributes
        list_options
        exit_program
    end

    def list_plants
        plants_array = Scraper.scrape_list_page(Base_Path + 'list.html')
        plants_array.each.with_index(1) do |plant, index|
            puts "#{index}. #{plant}"
        end
        # Plant.create_from_list(plants_array)
    end

    def plant_attributes
        Plant.all.each do |plant|
            attributes = Scraper.scrape_list_page(BASE_PATH + plant.product_url)
            plant.add_plant_attributes(attributes)
        end
    end

    def list_options
       while true
            puts "Enter the number of the plant you would like more info on, or type list to display plant list again, or type exit"
            input = gets.strip
                    
            if input.to_i != 0
                Plant.all.each do |plant|
                    puts "#{plant.quick_info}"
                    puts "#{plant.description}"
                    puts "#{plant.rating}"
                end
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
