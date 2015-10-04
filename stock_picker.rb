def stock_picker(arr)
	diffArray = []
	setArray = []
	arr.each_with_index do |element1, index1|
		arr.each_with_index do |element2, index2|
			if index2 >= index1
				difference = element2 - element1
				diffArray << difference
				setArray << [index1, index2]
			end
		end
	end
	puts setArray[diffArray.index(diffArray.max)]
end

=begin
	Each time I find a difference, I put the difference
	in one array and the corresponding indeces in
	another array simultaneously (this way, the difference
	and the set of indeces have the same index). Then I
	take the index of the maximum difference and use that
	same index in the array of index sets and find the
	corresponding indeces.
=end

stock_picker([2,4,3,5,1,7,9,3,5,6])