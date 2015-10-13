def ask question
	goodAnswer = false
	while (not goodAnswer)
		puts question
		reply = gets.chomp.downcase

		if (reply == 'yes' or reply == 'no')
			goodAnswer = true
			if reply == 'yes'
				answer = true
			else
				answer = false
			end
		else
			puts 'Please answer "yes" or "no".'
		end
	end

	answer
end

puts "Hello, and thank you for participating in this"
puts "brief evaluation. This is a simple survey regarding"
puts "your affinity, or lack thereof, to Mexican food and"
puts "has nothing to do with your habits of bedwetting, or"
puts "lack thereof. I will begin the questions."
puts

ask "Do you like eating tacos?"
ask "Do you like eating burritos?"
ask "Do you like eating tortas?"
wetsBed = ask "Do you wet the bed?"
ask "Do you like eating chimichangas?"
ask "Do you like eating sopapillas?"
ask "Do you like eating tamales?"
puts "Just a few more questions..."
ask "Do you like drinking jamaica?"
ask "Do you like eating flautas?"

puts
puts "DEBRIEFING:"
puts "Thank you for participating in this study. This"
puts "was actually an evaluation to test and see if"
puts "you wet the bed, but it was disguised as a"
puts "survey about Mexican food just to throw you"
puts "off."
puts
puts wetsBed