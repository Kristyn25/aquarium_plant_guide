require_relative "scraper.rb"
require_relative "plant.rb"
require 'nokogiri'

class CLI #AquariumPlantGuide::CLI
    Base_Path = "https://www.aquariumcoop.com/collections/live-plants"

    def start
        puts "Welcome to the Aquarium Plant Guide"
        list_plants
        plant_attributes
        list_options
        display_plant_info
        exit_program
    end

    def list_plants
        plants_array = Scraper.scrape_list_page(Base_Path + 'list.html')
        Plant.create_from_list(plants_array)
        #plants_array.each.with_index(1) do |plant, index|
            #puts "#{index}. #{plant}"
        #end
    end

    def plant_attributes
        Plant.all.each do |plant|
            attributes = Scraper.scrape_list_page(Base_Path + plant.product_url)
            plant.plant_attributes(attributes)
        end
    end

    def display_plant_info
        Plant.all.each do |plant|
            puts "Quick Info:" + "#{plant.quick_info}"
            puts "Description:" + "#{plant.description}"
            puts "Rating:" + "#{plant.rating}"
        end
    end 

    def list_options
       while true
            puts "Enter the number of the plant you would like more info on, or type list to display plant list again, or type exit"
            input = gets.strip
                    
            if input.to_i != 0
                display_plant_info
                #Plant.all.each do |plant|
                    #puts "Quick Info:" + "#{plant.quick_info}"
                    #puts "Description:" + "#{plant.description}"
                    #puts "Rating:" + "#{plant.rating}"
                #end
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
