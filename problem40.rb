#problem40

acc = (0..1000000).to_a.join

result = []
[1, 10, 100, 1000, 10000, 100000, 1000000].each {|i|
	result << acc[i].to_i
}

print result.inject(:*), "\n"
