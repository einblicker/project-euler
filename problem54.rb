#problem54
class Card
  @@overs = {"T" => 10, "J" => 11,  "Q" => 12,  "K" => 13,  "A" => 14}
  attr_reader :num, :surt
  def initialize(str)
    @num = if (it = str[0].to_i) == 0 then @@overs[str[0]] else it end
    @surt = str[1].to_sym
  end
end

class Hand < Array
  def battle(ene)
    mypoint, enepoint = score_num, ene.score_num
    if mypoint == enepoint then
      mycard, enecard = search, ene.search
      tmp = much(yaku(mypoint,mycard).sort.reverse, yaku(enepoint,enecard).sort.reverse)
      return tmp if not tmp.nil?
      much(mycard.keys.sort.reverse, enecard.keys.sort.reverse)
    else
      mypoint > enepoint
    end
  end

  def much(lis1, lis2)
    lis1.zip(lis2).each{|elems|
      return elems[0] > elems[1] if elems[0] != elems[1]
    }
    nil
  end

  def score_num
    return 10 if royal?
    return 9 if straight_flash?
    return 8 if four?
    return 7 if full?
    return 6 if flash?
    return 5 if straight?
    return 4 if three?
    return 3 if two?
    return 2 if one?
    return 1
  end

  def yaku(num, hs)
    case num
    when 10
      [10,11,12,13,14]
    when 9
      hs.keys
    when 8
      [hs.key(4)]
    when 7
      hs.keys
    when 6
      hs.keys
    when 5
      hs.keys
    when 4
      [hs.key(3)]
    when 3
      tmp = []
      hs.each_pair{|k,v| tmp << k if v == 2}
      tmp
    when 2
      [hs.key(2)]
    when 1
      hs.keys
    end
  end

  def search
    tmp = Hash.new(0)
    each_with_index {|elem1, i|
      tmp[elem1.num] += 1
    }
    tmp
  end
  
  def royal?
    if straight? then
      [10,11,12,13,14].each { |i|
        return false unless include?(i)
      }
      return true
    end
    false
  end
  
  def straight_flash?
    straight? and flash?
  end
	
  def four?
    search.values.include?(4)
  end

  def full?
    three? and one?
  end

  def flash?
    all? {|elem| self[0].surt == elem.surt}
  end

  def straight?
    tmp = map {|elem| elem.num}.sort
    (tmp.size - 1).times {|i|
      return false if tmp[i] != tmp[i+1] - 1
    }
    true
  end

  def three?
    search.values.include?(3)
  end

  def two?
    search.values.find_all{|elem| elem == 2}.size == 2
  end

  def one?
    search.values.include?(2)
  end

end

count = 0
open("poker.txt") {|file|
  file.each{|line|
    tmp = line.split(/\s/)
    p1 = Hand.new(tmp[0, (tmp.size/2)].map{|elem| Card.new(elem)})
    p2 = Hand.new(tmp[(tmp.size/2),tmp.size].map{|elem| Card.new(elem)})
    count += 1 if p1.battle(p2)
  }
}

print count, "\n"
