#problem34

def fact(n)
  return 1 if n <= 0
  total = 1
  (2..n).each {|i|
    total *= i
  }
  return total
end

result = 0

(3..50000).to_a.each {|num|
  tmp = num.to_s.split(//).map{|elem| fact(elem.to_i)}.inject{|i,j| i+j}
  result += num if tmp == num
}

print result, "\n"
