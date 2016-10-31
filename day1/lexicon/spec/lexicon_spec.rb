require_relative "../app/lexicon.rb"

describe Lexicon do
  before(:all) do
    @my_lexicon = Lexicon.new
  end
  describe '.eat_t' do
    it 'eat the T letters to sentence 1' do
      expect(@my_lexicon.eat_t("great scott!")).to eq("grea sco!")
    end
    
    it 'eat the T letters to sentence 2' do
      expect(@my_lexicon.eat_t("take that money")).to eq("ake ha money")
    end  
  end
  
  describe '.shazam' do
    it 'shazam "This is a boring test"' do
      expect(@my_lexicon.shazam(["This", "is", "a", "boring", "test"])). to eq(["sih","se"])
    end

    it 'shazam "Try other phrase to test"' do
      expect(@my_lexicon.shazam(["Try", "other", "phrase", "to", "test"])).to eq(["yr","se"])
    end    
  end


  describe '.oompa_loompa' do
    it 'oompa_loompa for array ["if","you","wanna","be","my","lover"]' do
      expect(@my_lexicon.oompa_loompa(["if","you","wanna","be","my","lover"])).to eq(["if","you","be","my"])
      
    end
    it 'oompa_loompa for array ["This","world"]' do
      expect(@my_lexicon.oompa_loompa(["This","world"])).to eq(["his"])
    end    
  end

end
