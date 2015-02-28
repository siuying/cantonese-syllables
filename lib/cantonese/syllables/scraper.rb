require 'http'
require 'nokogiri'
require 'pry'

module Cantonese
  module Syllables
    class Scraper
      LIST_URL = "http://humanum.arts.cuhk.edu.hk/Lexis/lexi-mf/syllables.php"

      INITIAL_REGEXP = %r{phonetic_initial\[[0-9]+\] = "([^"]*)";}
      FINAL_REGEXP = %r{phonetic_final\[[0-9]+\] = "([^"]*)";}
      TONE_REGEXP = %r{phonetic_tone\[[0-9]+\] = "([^"]*)";}

      # get syllables list
      def self.list
        base_url = URI.parse("http://humanum.arts.cuhk.edu.hk/Lexis/lexi-mf/syllables.php")
        doc = Nokogiri::HTML(HTTP.get(LIST_URL).body.to_s)
        doc.search("#syllables_table td a").collect do |node| 
          text = node.text
          url = base_url.merge(node['href']).to_s
          {text: text, url: url }
        end
      end

      # get detail for a syllable
      def self.syllable(url)
        doc = Nokogiri::HTML(HTTP.get(url).body.to_s)
        doc.search(".pho-rel tr").collect do |node|
          cells = node.search("td")
          js = cells[0].text rescue nil
          phonetic = js.match(INITIAL_REGEXP)[1] + js.match(FINAL_REGEXP)[1] + js.match(TONE_REGEXP)[1] rescue nil
          text = cells[2].text.split(",").collect{|text| text.strip } rescue nil

          if text && phonetic
            {syllable: phonetic, characters: text}
          else
            nil
          end
        end.compact
      end
    end
  end
end
