class OrangeTree

	def initialize
		@height = 0
		@orangeCount = 0
	end

	def height
		@height + " feet"
	end

	def countTheOranges
		if @orangeCount == 1
			puts "There is " + @orangeCount.to_s + " orange on the tree."
		else
		puts "There are " + @orangeCount.to_s + " oranges on the tree."
		end
	end

	def pickAnOrange
		if @orangeCount == 0
			puts "There are no oranges to pick."
		else
			@orangeCount = @orangeCount - 1
			puts "That was a delicious orange!"
		end
	end

	def oneYearPasses
		@height = @height + 4
		if @height > 32
			@orangeCount = 10
		end
		if @height > 64
			@orangeCount = @orangeCount + 10
		end
		if @height > 96
			@orangeCount = @orangeCount + 10
		end
		if @height > 128
			@orangeCount = @orangeCount + 10
		end
		if @height > 200
			puts "The tree is now dead."
			exit
		end
	end

end

tree = OrangeTree.new
5.times do
	tree.oneYearPasses
end
tree.pickAnOrange
