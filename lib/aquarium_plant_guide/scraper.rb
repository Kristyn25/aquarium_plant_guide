require 'nokogiri'
require 'open-uri'

class Scraper
    attr_accessor :plant

    @@all = []

    def self.scrape_list_page(list_url)
        plants = []
        html = Nokogiri::html(open(list_url))
        html.css("div.grid-view-item product-card").each do |plant|
            plants << {
                name: plant.css("span.visually-hidden").text
            }
        end
    end
    plants
end

