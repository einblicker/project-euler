#problem22

$tbl = Hash[('A'..'Z').to_a.zip((1..26).to_a)]

def score(x, i)
	$tbl.values_at(*(x.split(//))).inject{|n,m| n+m} * i
end

open("names.txt", "r") {|file|
	total = 0
	file.gets.split(/,/).map{|elem| elem.delete("\"")}.sort.
	each_with_index{|elem, i| total += score(elem, i+1)}
	print total, "\n"
}

