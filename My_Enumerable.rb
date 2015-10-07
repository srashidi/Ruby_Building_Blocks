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

end

[1,2,3,4].my_each {|value| puts value*2}
{:Shaunty => "Hossein", :Austin => "Danger"}.my_each {|key, value| puts value+"Blah"}
[1,2,3,4].my_each_with_index {|value,index| print "#{value*2} #{index} "}
{:Shaunty => "Hossein", :Austin => "Danger"}.my_each_with_index {|(key, value),index| puts value+"Blah #{index}"}
