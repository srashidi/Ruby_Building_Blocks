puts "Hello there! What's your first name?"
first_name = gets.chomp #chomp gets rid of the extra ENTER
puts "What about your middle name?"
middle_name = gets.chomp
puts "And your last name?"
last_name = gets.chomp
puts "Your name is #{first_name} #{middle_name} #{last_name}? What a lovely name!"
puts "Pleased to meet you, #{first_name}. :-)"
puts "Did you know there are #{(first_name.length+middle_name.length+last_name.length).to_s} letters in your name?"
puts ''
puts "What's your favorite number?"
favorite_number = gets.chomp
if favorite_number = 6 || favorite_number = 66 || favorite_number = 666
	puts "The mark of the beast!!!!! You have the devil in you!"
else
	puts "#{favorite_number} is a nice number, but have you ever thought of #{(favorite_number.to_i+1).to_s}?"
end