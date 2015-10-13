class Die

	def initialize
		roll
	end

	def roll
		@numberShowing = 1 + rand(6)
	end

	def showing
		@numberShowing
	end

	def cheat
		@numberShowing = gets.chomp
		if (@numberShowing.kind_of?(Integer) == false or @numberShowing < 1 or @numberShowing > 6)
			puts "Restart the program and try again."
			exit
		end
	end
			

end

puts "Choose which side of the die is showing."
die = Die.new
die.cheat
puts die.showing
puts

dice = [Die.new,Die.new]

dice.each do |die|
	puts die.roll
end
puts

die = Die.new
die.roll
puts die.showing
puts die.showing
die.roll
puts die.showing
puts die.showing