#problem59-sub
open("cipher1.txt") {|file|
  print "("
  file.each{|line|
    print line.split(/,/).join(" ")
  }
  print ")"
}
