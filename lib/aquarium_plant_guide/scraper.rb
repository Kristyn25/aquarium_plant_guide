require 'nokogiri'
require 'open-uri'

class Scraper
    attr_accessor :plant

    @@all = []

    def self.scrape_list_page
        plants = []
        html = Nokogiri::html
        