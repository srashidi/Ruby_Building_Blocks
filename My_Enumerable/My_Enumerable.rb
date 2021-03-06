module Enumerable

	def my_each
		if block_given?
			for element in self
				yield(element)
			end
		end
	end

	def my_each_with_index
		if block_given?
			i = 0
			for element in self
				yield(element,i)
				i += 1
			end
		end
	end

	def my_select
		if block_given?
			result = self.class.new
			if self.class == Array
				i = 0
				self.my_each do |element|
					if yield(element)
						result[i] = element
						i += 1
					end
				end
			elsif self.class == Hash
				self.my_each do |key, value|
					if yield(key,value)
						result[key] = value
					end
				end
			end
			result
		end
	end

	def my_all?
		result = true
		if block_given?
			self.my_each do |element|
				if yield(element)
					result = true
				else
					result = false
					break
				end
			end
		else
			self.my_each do |element|
				if element
					result = true
				else
					result = false
					break
				end
			end
		end
		result
	end

	def my_any?
		result = false
		if block_given?
			self.my_each do |element|
				if yield(element)
					result = true
					break
				else
					result = false
				end
			end
		else
			self.my_each do |element|
				if element
					result = true
					break
				else
					result = false
				end
			end
		end
		result
	end

	def my_none?
		result = true
		if block_given?
			self.my_each do |element|
				if yield(element)
					result = false
					break
				else
					result = true
				end
			end
		else
			self.my_each do |element|
				if element
					result = false
					break
				else
					result = true
				end
			end
		end
		result
	end

	def my_count(*param,&block)
		result = self.size
		if param[-1]
			if block_given?
				puts "warning: given block not used"
			end
			result = self.my_select {|x| x == param[-1]}.size
		elsif block_given? && param.empty?
			result = self.my_select(&block).size
		end
		result
	end

	def my_map(proc)
		result = self
		if proc
			result = Array.new
			self.my_each {|element| result << proc.call(element)}
			if block_given?
				old_array = result
				result = Array.new
				old_array.my_each {|element| result << yield(element)}
			end
		end
		result
	end

	def my_inject(*params)
		if self.class == Range
			arr = self.to_a
		else
			arr = self
		end
		if params[0].is_a? Numeric
			result = params[0]
			i = 0
		else
			result = arr[0]
			i = 1
		end
		if params[-1].is_a? Symbol
			while i < arr.size do
				result = result.send(params[-1],arr[i])
				i += 1
			end
		elsif block_given?
			while i < arr.size do
				result = yield(result,arr[i])
				i += 1
			end
		end
		result
	end

end

=begin
#control tests
[1,2,3,4].each {|value| puts value*2}
{:Shaunty => "Hossein", :Austin => "Danger"}.each {|key, value| puts value+"Blah"}

[1,2,3,4].each_with_index {|value,index| print "#{value*2} #{index} "}
{:Shaunty => "Hossein", :Austin => "Danger"}.each_with_index {|(key, value),index| puts value+"Blah #{index}"}

puts [1,2,3,4].select {|value| value < 3}.inspect
h1 = {Shaunty: "Hossein", Austin: "Danger"}.select {|key, value| value.include?("H")}
puts h1.to_s

puts [1,2,3,4].all? {|value| value%2 == 0}
puts [1,2,3,4].all? {|value| value > 0}
h2 = {:Shaunty => "Hossein", :Austin => "Danger"}.all? {|key, value| value.include?("H")}
h3 = {:Shaunty => "Hossein", :Austin => "Danger"}.all? {|key, value| value.include?("e")}
puts h2.to_s
puts h3.to_s

puts [1,2,3,4].any? {|value| value%2 == 0}
puts [1,2,3,4].any? {|value| value > 0}
puts [1,2,3,4].any? {|value| value < 0}
h4 = {:Shaunty => "Hossein", :Austin => "Danger"}.any? {|key, value| value.include?("H")}
h5 = {:Shaunty => "Hossein", :Austin => "Danger"}.any? {|key, value| value.include?("e")}
h6 = {:Shaunty => "Hossein", :Austin => "Danger"}.any? {|key, value| value.include?("z")}
puts h4.to_s
puts h5.to_s
puts h6.to_s

puts [1,2,3,4].none? {|value| value%2 == 0}
puts [1,2,3,4].none? {|value| value > 0}
puts [1,2,3,4].none? {|value| value < 0}
h7 = {:Shaunty => "Hossein", :Austin => "Danger"}.none? {|key, value| value.include?("H")}
h8 = {:Shaunty => "Hossein", :Austin => "Danger"}.none? {|key, value| value.include?("e")}
h9 = {:Shaunty => "Hossein", :Austin => "Danger"}.none? {|key, value| value.include?("z")}
puts h7.to_s
puts h8.to_s
puts h9.to_s

puts [1,2,3,2,2,4,2].count
puts [1,2,3,2,2,4,2].count(2)
puts [1,2,3,2,2,4,2].count {|value| value < 3}
puts [1,2,3,2,2,4,2].count(2) {|value| value < 3}
h10 = {:Shaunty => "Hossein", :Austin => "Danger"}.count
h11 = {:Shaunty => "Hossein", :Austin => "Danger"}.count {|key, value| value.include?("H")}
h12 = {:Shaunty => "Hossein", :Austin => "Danger"}.count {|key, value| value.include?("e")}
h13 = {:Shaunty => "Hossein", :Austin => "Danger"}.count {|key, value| value.include?("z")}
puts h10.to_s
puts h11.to_s
puts h12.to_s
puts h13.to_s

puts "Control map:"
puts [1,2,3,4].map {|value| value*2}.inspect
h14 = {:Shaunty => "Hossein", :Austin => "Danger"}.map {|key, value| value+"Blah"}
puts h14.to_s

puts (5..10).inject(:+)
puts (5..10).inject {|sum, n| sum + n}
puts (5..10).inject(1, :*)
puts (5..10).inject(1) {|product, n| product * n}
longest = %w{ cat sheep bear }.inject do |memo, word|
   memo.length > word.length ? memo : word
end
puts longest

puts ""

#new method tests
[1,2,3,4].my_each {|value| puts value*2}
{:Shaunty => "Hossein", :Austin => "Danger"}.my_each {|key, value| puts value+"Blah"}

[1,2,3,4].my_each_with_index {|value,index| print "#{value*2} #{index} "}
{:Shaunty => "Hossein", :Austin => "Danger"}.my_each_with_index {|(key, value),index| puts value+"Blah #{index}"}

puts [1,2,3,4].my_select {|value| value < 3}.inspect
h1 = {Shaunty: "Hossein", Austin: "Danger"}.my_select {|key, value| value.include?("H")}
puts h1.to_s

puts [1,2,3,4].my_all? {|value| value%2 == 0}
puts [1,2,3,4].my_all? {|value| value > 0}
h2 = {:Shaunty => "Hossein", :Austin => "Danger"}.my_all? {|key, value| value.include?("H")}
h3 = {:Shaunty => "Hossein", :Austin => "Danger"}.my_all? {|key, value| value.include?("e")}
puts h2.to_s
puts h3.to_s

puts [1,2,3,4].my_any? {|value| value%2 == 0}
puts [1,2,3,4].my_any? {|value| value > 0}
puts [1,2,3,4].my_any? {|value| value < 0}
h4 = {:Shaunty => "Hossein", :Austin => "Danger"}.my_any? {|key, value| value.include?("H")}
h5 = {:Shaunty => "Hossein", :Austin => "Danger"}.my_any? {|key, value| value.include?("e")}
h6 = {:Shaunty => "Hossein", :Austin => "Danger"}.my_any? {|key, value| value.include?("z")}
puts h4.to_s
puts h5.to_s
puts h6.to_s

puts [1,2,3,4].my_none? {|value| value%2 == 0}
puts [1,2,3,4].my_none? {|value| value > 0}
puts [1,2,3,4].my_none? {|value| value < 0}
h7 = {:Shaunty => "Hossein", :Austin => "Danger"}.my_none? {|key, value| value.include?("H")}
h8 = {:Shaunty => "Hossein", :Austin => "Danger"}.my_none? {|key, value| value.include?("e")}
h9 = {:Shaunty => "Hossein", :Austin => "Danger"}.my_none? {|key, value| value.include?("z")}
puts h7.to_s
puts h8.to_s
puts h9.to_s

puts [1,2,3,2,2,4,2].my_count
puts [1,2,3,2,2,4,2].my_count(2)
puts [1,2,3,2,2,4,2].my_count {|value| value < 3}
puts [1,2,3,2,2,4,2].my_count(2) {|value| value < 3}
h10 = {:Shaunty => "Hossein", :Austin => "Danger"}.my_count
h11 = {:Shaunty => "Hossein", :Austin => "Danger"}.my_count {|key, value| value.include?("H")}
h12 = {:Shaunty => "Hossein", :Austin => "Danger"}.my_count {|key, value| value.include?("e")}
h13 = {:Shaunty => "Hossein", :Austin => "Danger"}.my_count {|key, value| value.include?("z")}
puts h10.to_s
puts h11.to_s
puts h12.to_s
puts h13.to_s

puts "Test my_map:"
proc1 = Proc.new {|value| value*2}
proc2 = Proc.new {|key, value| value+"Blah"}
puts [1,2,3,4].my_map(proc1).inspect
h14 = {:Shaunty => "Hossein", :Austin => "Danger"}.my_map(proc2)
puts h14.to_s
puts [1,2,3,4].my_map(proc1) {|value| value - 1}.inspect
h15 = {:Shaunty => "Hossein", :Austin => "Danger"}.my_map(proc2) {|value| value.downcase}
puts h15.to_s

puts (5..10).my_inject(:+)
puts (5..10).my_inject {|sum, n| sum + n}
puts (5..10).my_inject(1, :*)
puts (5..10).my_inject(1) {|product, n| product * n}
longest = %w{ cat sheep bear }.my_inject do |memo, word|
   memo.length > word.length ? memo : word
end
puts longest

def multiply_els(arr)
	arr.my_inject(:*)
end

puts multiply_els([2,4,5])
=end