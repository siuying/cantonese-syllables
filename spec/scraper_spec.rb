require "cantonese/syllables/scraper"

describe Cantonese::Syllables::Scraper do
  let (:'scraper') { Cantonese::Syllables::Scraper }
  context "#list" do
    it "should return syllable list" do
      expect(scraper.list).to be_a(Array)
      expect(scraper.list).to be_include("啊")
      expect(scraper.list).to be_include("哼")
    end
  end
end