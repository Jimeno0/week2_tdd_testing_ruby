class Lexicon
  def initialize

  end
  def eat_t(args)
    letters = args.downcase.chars
    phrase = ""
    letters.each do |e| 
      if e != "t"
        phrase+= e
      end
    end
    phrase
  end
  
  def shazam(arr)
    arr.map! do |word|
      eat_t(word).reverse
    end
    [arr[0],arr[-1]]
  end

  def oompa_loompa(arr)
    result = []
    arr.map! do |word|
      eat_t(word)  
    end
    arr.each do |word|
      if word.length<=3
        result.push(word)
      end
    end
    result
  end
  
end