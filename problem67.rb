#problem67
tree = open("triangle.txt") {|f|
  f.read.split(/[\n]/).map{|line| line.split(/\s/).map{|elem| elem.to_i}}
}

class Array
  def pairs
    zip(self[1,size])[0,size-1]
  end
end

tree.reverse!

(tree.size-1).times{|i|
  k = 0
  tree[i].pairs.each{|elem|
    tree[i+1][k] = (tree[i+1][k] + elem.max)
    k += 1
  }
}

print tree.last[0], "\n"
