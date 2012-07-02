#problem42-sub
open('words.txt') {|file| 
  print "("
  file.gets.gsub(/"/, "").split(/,/).each{|line|
    print line.inspect
    print " "
  }
  print ")"
}
