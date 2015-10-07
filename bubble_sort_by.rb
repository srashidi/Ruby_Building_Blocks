def bubble_sort_by(arr,&block)
	until (arr.each_with_index do |value, index|
		if index < (arr.size - 1)
			if block.call(value,arr[index+1]) <= 0
				true
			else
				false
				break
			end
		end
	end)
		arr.each_with_index do |value, index|
			if index < (arr.size - 1)
				if block.call(value,arr[index+1]) > 0
					arr[index] = arr[index+1]
					arr[index+1] = value
				end
			end
		end
	end
	puts arr.inspect
end

bubble_sort_by(["hi","howdy","hello","hey","hiho"]) {|left, right| left.length - right.length}
bubble_sort_by(["hi","hello","hey"]) {|left, right| left.length - right.length}