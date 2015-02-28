require 'http'
require 'nokogiri'
require 'pry'

module Cantonese
  module Syllables
    class Scraper
      LIST_URL = "http://humanum.arts.cuhk.edu.hk/Lexis/lexi-mf/syllables.php"

      # get syllables list
      def self.list
        doc = Nokogiri::HTML(HTTP.get(LIST_URL).body.to_s)
        doc.search("#syllables_table td a").collect { |node| node.text }
      end
    end
  end
end
