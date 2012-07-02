#problem35
def make_primep(z)
  p_lst = []

  (2..z).each{|i|
    is_prime = true
    (2..Math.sqrt(i).to_i).each{|j|
      if i % j == 0 then
        is_prime = false
        break
      end
    }
    p_lst << i if is_prime
  }

  lambda {|x|
    return true if p_lst.include?(x)
    false
  }
end

$prime = make_primep(100000)

def circle_primep (x)
  x1 = x.to_s.split(//).map{|e| e.to_i}
  acc = []
  x1.size.times{
    tmp = x1.push(x1.shift).dup
    acc << tmp
  }
  acc.map{|elem| $prime[elem.join.to_i]}
end

def solve
  acc = []
  (2...100000).each{|i|
    acc << i unless circle_primep(i).include?(false)
  }
  acc.size
end

print solve , "\n"
