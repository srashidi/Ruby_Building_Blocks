def englishNumber number
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

	#left is how much of the number we still have "left" to write out
	#write is what we're "writing" out currently

	left = number

	write = left/1000000000000000
	left = left - write*1000000000000000
	if write > 0
		quadrillions = englishNumber write
		numString = numString + quadrillions + ' quadrillion'
		if left > 0
			numString = numString + ' '
		end
	end

	write = left/1000000000000
	left = left - write*1000000000000
	if write > 0
		trillions = englishNumber write
		numString = numString + trillions + ' trillion'
		if left > 0
			numString = numString + ' '
		end
	end

	write = left/1000000000
	left = left - write*1000000000
	if write > 0
		billions = englishNumber write
		numString = numString + billions + ' billion'
		if left > 0
			numString = numString + ' '
		end
	end

	write = left/1000000
	left = left - write*1000000
	if write > 0
		millions = englishNumber write
		numString = numString + millions + ' million'
		if left > 0
			numString = numString + ' '
		end
	end

	write = left/1000
	left = left - write*1000
	if write > 0
		thousands = englishNumber write
		numString = numString + thousands + ' thousand'
		if left > 0
			numString = numString + ' '
		end
	end

	write = left/100 #to figure out how many hundreds are left to write out
	left = left - write*100 #to subtract off the hundreds
	if write > 0
		numString = numString + onesPlace[write-1] + ' hundred'
		if left > 0
			numString = numString + ' '
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
			numString = numString + '-'
		end
	end

	write = left
	left = 0

	if write > 0
		numString = numString + onesPlace[write-1]
	end

	numString
end

bottles = 9999

while bottles > 0
	if bottles == 1
		puts "#{englishNumber(bottles).capitalize} bottle of Coke on the wall!"
		puts "#{englishNumber(bottles).capitalize} bottle of Coke!"
		puts "You take one down, pass it around!"
		bottles -= 1
		puts "#{englishNumber(bottles).capitalize} bottles of Coke on the wall!"
		puts ''
	else
		puts "#{englishNumber(bottles).capitalize} bottles of Coke on the wall!"
		puts "#{englishNumber(bottles).capitalize} bottles of Coke!"
		puts "You take one down, pass it around!"
		bottles -= 1
			if bottles == 1
				puts "#{englishNumber(bottles).capitalize} bottle of Coke on the wall!"
			else
				puts "#{englishNumber(bottles).capitalize} bottles of Coke on the wall!"
			end
			puts ''
	end
end