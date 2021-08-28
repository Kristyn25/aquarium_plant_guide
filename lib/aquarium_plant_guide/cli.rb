require_relative "scraper.rb"
require_relative "plant.rb"
require 'nokogiri'

class CLI #AquariumPlantGuide::CLI
    Base_Path = "https://www.aquariumcoop.com"

    def start
        puts "Welcome to the Aquarium Plant Guide"
        list_plants
        plant_attributes
        list_options
    end

    def list_plants
        if Plant.all.empty?
            Plant.create_from_list(Scraper.scrape_list_page)

        end

        Plant.all.each.with_index(1) do |plant, index|
            puts "#{index}. #{plant.name}"
        end
    end

    def plant_attributes
        Plant.all.each do |plant|
            attributes = Scraper.scrape_product_page(Base_Path + plant.product_url)
            plant.plant_attributes(attributes)
        end
    end

    def input_to_index(user_input)
        user_input.to_i-1
    end

    def display_plant_info (user_input)
        user_input.to_i
        index = input_to_index(user_input)
        plant = Plant.all[index]
        
        puts "Name:" + "#{plant.name}\n\n"
        puts "Quick Info:" + "#{plant.quick_info}\n"
        puts "Description:" + "#{plant.description}\n\n"
        puts "Rating:" + "#{plant.rating} / 5\n\n"
    end 

    def list_options
       while true
            puts "Enter the number of the plant you would like more info on, or type list to display plant list again, or type exit"
            user_input = gets.strip
                    
            if user_input.to_i != 0
                display_plant_info(user_input)
            elsif user_input == "list"
                list_plants
            elsif user_input == "exit"
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
