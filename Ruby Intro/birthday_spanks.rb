puts "What year were you born?"
year = gets.chomp

puts "What month were you born?"
monthName = gets.chomp.capitalize
case monthName
when "January"
	month = 1
when "February"
	month = 2
when "March"
	month = 3
when "April"
	month = 4
when "May"
	month = 5
when "June"
	month = 6
when "July"
	month = 7
when "August"
	month = 8
when "September"
	month = 9
when "October"
	month = 10
when "November"
	month = 11
when "December"
	month = 12
else
	puts "That can't be a month!"
end

puts "What day of the month were you born?"
day = gets.chomp

birthday = Time.mktime(year,month,day)
ageSeconds = Time.new - birthday
age = ageSeconds/60/60/24/365.25
age = age.to_i

while age > 0
	puts "SPANK!"
	age -= 1
end