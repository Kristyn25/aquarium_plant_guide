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
        doc.css("div#Collection").css("div.grid-view-item").each do |plant|
            plants << {
                name: plant.css("span.visually-hidden")[0].text,
                product_url: plant.css("a").attribute("href").value
            }
        end
        plants
    end

    def self.scrape_product_page(product_url)
        plant_page = {}
               #html = open(product_url)
        product_page = Nokogiri::HTML(open(product_url))

        product_page.css("div.product-template__container page-width").each do |plant|
            #plant_page << {
            plant_page[:quick_info] = product_page.css("div.first_description").css("ul").text
            plant_page[:description] = product_page.css("div.second_description").text.strip
            plant_page[:rating] = product_page.css("div.product-single__meta").css("div.jdgm-prev-badge").attribute("data-average-rating").value
            #}
        end
        plant_page
    end
end

