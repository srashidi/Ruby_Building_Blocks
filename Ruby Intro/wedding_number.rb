def weddingNumber number
		if number < 0
		return "Please enter a number that isn't negative."
	end
	if number == 0
		return "zero"
	end

	numString = ''

	onesPlace = ['one','two','three','four','five','six','seven','eight','nine']
	tensPlace = ['ten','twenty','thirty','forty','fifty','sixty','seventy','eighty','ninety']
	teenagers = ['eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen']

	left = number

	write = left/100 #to figure out how many hundreds are left to write out
	left = left - write*100 #to subtract off the hundreds
	if write > 0
		hundreds = weddingNumber write
		numString = numString + hundreds + ' hundred'
		if left > 0
			numString = numString + ' and '
		end
	end

	write = left/10
	left = left - write*10

	if write > 0
		if ((write == 1) and (left > 0))
			numString = numString + teenagers[left-1]
			left = 0
		else
			numString = numString + tensPlace[write-1]
		end

		if left > 0
			numString = numString + ' and '
		end
	end

	write = left
	left = 0

	if write > 0
		numString = numString + onesPlace[write-1]
	end

	numString
end

puts weddingNumber 0
puts weddingNumber 9
puts weddingNumber 10
puts weddingNumber 11
puts weddingNumber 17
puts weddingNumber 32
puts weddingNumber 88
puts weddingNumber 99
puts weddingNumber 100
puts weddingNumber 101
puts weddingNumber 234
puts weddingNumber 1920
puts weddingNumber 2015
puts weddingNumber 2103