def stock_picker(arr)
	if arr.index(arr.min) < arr.index(arr.max)
		arrIdeal = [arr.index(arr.min),arr.index(arr.max)]
	end
	puts arrIdeal
end

stock_picker([2,4,3,5,1,7,9,3,5,6])