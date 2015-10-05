def substrings(str, substr_arr)
	frequencies = Hash.new(0)
	str.downcase!
	substr_arr.each do |substr|
		frequencies[substr] +=1 if str[substr]
	end
	frequencies
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)