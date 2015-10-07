def bubble_sort(arr)
	arr.each_with_index do |value, index|
		if (value <=> arr[index+1]) == 1
			arr[index] = arr[index+1]
			arr[index+1] = value
		end
	end
	puts arr.inspect
end

bubble_sort([4,3,78,2,0,2])