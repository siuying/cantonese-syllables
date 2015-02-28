require "cantonese/syllables/scraper"

describe Cantonese::Syllables::Scraper do
  let (:'scraper') { Cantonese::Syllables::Scraper }
  context "#list" do
    it "should return syllable list" do
      list = scraper.list
      expect(list).to be_a(Array)
      expect(list).to be_include(text: "啊", url: "http://humanum.arts.cuhk.edu.hk/Lexis/lexi-mf/pho-rel.php?initial=-&final=aa")
      expect(list).to be_include(text: "哼", url: "http://humanum.arts.cuhk.edu.hk/Lexis/lexi-mf/pho-rel.php?initial=h&final=ng")
    end
  end

  context "#syllable" do
    it "should return syllable details" do
      syllable = scraper.syllable("http://humanum.arts.cuhk.edu.hk/Lexis/lexi-mf/pho-rel.php?initial=-&final=aa")
      expect(syllable).to be_a(Array)
      expect(syllable).to be_include(syllable: "aa4", characters: ["啊"])
    end
  end
end