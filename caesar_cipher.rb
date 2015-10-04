def caesar_cipher(str, num=0)
	uppers = ("A".."Z").to_a
	lowers = ("a".."z").to_a
	numbers = ("0".."9").to_a
	@i = 0
	@str = str
	@num = num

=begin
I refactored the shift method for each character.
It can now take any set of letters, numbers, symbols, etc. from an array.
All I need to do is enter the method, specifying the array.
=end

	def shift_action(arr, char)
		newIndex = (arr.index(char) + @num%arr.length)%arr.length
		@str[@i] = arr[newIndex]
	end

	str.each_char do |char|
		if char =~ /[A-Z]/
			shift_action(uppers, char)
		elsif char =~ /[a-z]/
			shift_action(lowers, char)
		elsif char =~ /[0-9]/
			shift_action(numbers, char)
		end
		@i += 1
	end

	puts @str

end

caesar_cipher("This is EXTREMELY difficult to the power of 8675309!",5)