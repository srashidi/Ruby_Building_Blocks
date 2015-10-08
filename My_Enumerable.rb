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
		result = true
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
		result = false
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

	def my_count(*param)
		if param.empty? && block_given? == false
			result = self.size
		elsif param[-1]
			result = self.my_select {|x| x == param[-1]}.size
		elsif block_given? && param.empty?
			#result = self.my_select(yield).size
			#issue with passing block into the method
		end
		result
	end

end

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