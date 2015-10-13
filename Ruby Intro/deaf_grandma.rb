say = ''
puts "HI, SONNY!"

while say != "BYE"
	say = gets.chomp

	if say == "BYE"
		puts "HUH!?"
		say = gets.chomp
		if say == "BYE"
			puts "WHAT!?"
			say = gets.chomp
			if say == "BYE"
				puts "OK, BYE!"
			end
		end
	end

	if say != say.upcase
		puts "HUH!?!? SPEAK UP, SONNY!"
	elsif say == "BYE"
	else
		puts "NO, NOT SINCE #{(1930 + rand(21)).to_s}!"
	end
end