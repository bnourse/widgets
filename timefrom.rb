
MIN = 60
HOUR = 60*MIN
DAY = 24*HOUR
WEEK = 7*DAY

cur_time = Time.now.to_f

puts "How many?"
num = gets.chomp.to_i

puts "What? (M,H,D,W)?"
unit = gets.chomp.downcase
time = 0

case unit
when "m"
	time = cur_time - (num*MIN)
when "h"
	time = cur_time - (num*HOUR)
when "d"
	time = cur_time - (num*DAY)
when "w"
	time = cur_time - (num*WEEK)
else
	time = 0
end

puts time
puts Time.at(time)