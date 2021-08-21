require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
    attr_accessor :plant

    @@all = []

    def self.scrape_list_page(list_url)
        plants = []
        list_url = "https://www.aquariumcoop.com/collections/live-plants"
        html = open(list_url)
        doc = Nokogiri::HTML(html)
        doc.css("div.grid-view-item").each do |plant|
            plants << {
                name: plant.css("span.visually-hidden")[0].text,
                product_url: plant.css("a").attribute("href").value
            }
        end
        plants
    end

    def self.scrape_product_page(product_url)
        plant_page = {}
        html = open(product_url)
        page = Nokogiri::HTML(html)
        page.css("div.second_description").each do |plant|
            plant_page << {
                description: plant_page.css("p").text.strip
            }
        end
        plant_page
    end
end

