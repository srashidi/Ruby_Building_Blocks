def caesar_cipher(str, num=0)
	uppers = ("A".."Z").to_a
	lowers = ("a".."z").to_a
	numbers = ("0".."9").to_a
	numAlpha = num % 26
	numNumer = num % 10
	i,j,k=0,0,0
	strArray = str.split(//)
	strArray.each do |char|
		if char =~ /A-Z/
			newIndex = (uppers.index(char) + numAlpha)%26
			strArray[i] = uppers[newIndex]
			i += 1
		end
	end
	strArray
end