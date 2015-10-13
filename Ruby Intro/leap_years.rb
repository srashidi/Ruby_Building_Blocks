startYear = 0
endYear = 0
year = 0

puts "I can list all the leap years between any given years."
puts "First give me a starting year:"
startYear = gets.chomp.to_i
puts "Now give me an ending year:"
endYear = gets.chomp.to_i
puts ''
puts "Here are the years between #{startYear} and #{endYear} that are leap years:"
year = startYear

while year <= endYear
	if year%4 == 0 and (year%100 != 0 or year%400 == 0)
		puts year
	end
	year += 1
end