words = []
input = 'default'

puts "Type in as many words as you want, pressing ENTER after each words."
puts "When finished, just press ENTER again, and the words will be returned in alphabetical order!"

while input != ''
	words.push gets.chomp
	input = words.last
end

words.pop
words.sort!

words.each do |word|
	puts word
end