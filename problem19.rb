#problem19
require 'date'
startday = Date.new(1901,1,1)
endday   = Date.new(2000,12,31)

days = []

startday.upto(endday) {|day|
	days << day if (day.cwday == 7 && day.mday == 1)
}

print days.size, "\n"
