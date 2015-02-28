require "bundler/gem_tasks"
$LOAD_PATH << "lib"

require "cantonese/syllables/scraper"
require 'json'

desc "scrape data file"
task :scrape do
  include Cantonese::Syllables

  all_characters = {}
  all_sounds = {}

  Scraper.list.each do |syllable|
    puts "Fetch #{syllable[:text]} ..."
    sounds = Scraper.syllable(syllable[:url])
    sounds.each do |sound|
      sound[:characters].each do |character|
        sounds = Scraper.word(character)
        all_characters[character] = sounds
        sounds.each do |sound|
          all_sounds[sound] ||= []
          all_sounds[sound] << character
        end        
      end
    end
  end

  # save output files
  File.open("data/characters.json","w") do |f|
    f.write(JSON.pretty_generate(all_characters))
  end
  File.open("data/sounds.json","w") do |f|
    f.write(JSON.pretty_generate(all_sounds))
  end
end