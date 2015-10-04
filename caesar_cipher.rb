def caesar_cipher(str, num=0)
	uppers = ("A".."Z").to_a
	lowers = ("a".."z").to_a
	numbers = ("0".."9").to_a
	numAlpha = num % 26
	numNumer = num % 10
	i = 0
	str.each_char do |char|
		if char =~ /[A-Z]/
			newIndex = (uppers.index(char) + numAlpha)%26
			str[i] = uppers[newIndex]
			i += 1
		elsif char =~ /[a-z]/
			newIndex = (lowers.index(char) + numAlpha)%26
			str[i] = lowers[newIndex]
			i += 1
		elsif char =~ /[0-9]/
			newIndex = (numbers.index(char) + numNumer)%10
			str[i] = numbers[newIndex]
			i += 1
		else
			i += 1
		end
	end
	puts str
end

caesar_cipher("This is difficult to the power of 8675309!",5)