#problem16
def solve(n)
	(2**n).to_s.split(//).map{|n| n.to_i}.inject{|n,m| n+m}
end
print solve(1000)
