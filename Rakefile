require "bundler/gem_tasks"
$LOAD_PATH << "lib"

require "cantonese/syllables/scraper"

desc "scrape data file"
task :scrape do
  include Cantonese::Syllables
  Scraper.list each do |syllable|
    sounds = Scraper.syllable(syllable[:url])
    sounds.each do |sound|
      sound[:characters].each do |character|
        
      end
    end
  end
end