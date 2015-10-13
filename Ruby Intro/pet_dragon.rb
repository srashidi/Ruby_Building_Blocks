class Dragon

	def initialize name
		@name = name
		@asleep = false
		@stuffInBelly = 10 # He's full
		@stuffInIntestine = 0 # He doesn't need to go

		puts @name + " is born!"
		puts "You can feed, walk, put to bed, toss, or rock him. Otherwise, you can exit."
	end

	def feed
		puts "You feed " + @name + "."
		@stuffInBelly = 10
		passageOfTime
	end

	def walk
		puts "You walk " + @name + "."
		@stuffInIntestine = 0
		passageOfTime
	end

	def putToBed
		puts "You put " + @name + " to bed."
		@asleep = true
		3.times do
			if @asleep
				passageOfTime
				puts @name + " snores, filling the room with smoke."
			end
		end
		if @asleep
			@asleep = false
			puts @name + " wakes up slowly."
		end
	end

	def toss
		puts "You toss " + @name + " up into the air."
		puts "He giggles, which singes your eyebrows."
		passageOfTime
	end

	def rock
		puts "You rock " + @name + " gently."
		@asleep = true
		puts "He briefly dozes off..."
		passageOfTime
		if @asleep
			@asleep = false
			puts "...but wakes when you stop."
		end
	end

	private

	def hungry?
		@stuffInBelly <= 2
	end

	def poopy?
		@stuffInIntestine >= 8
	end

	def passageOfTime
		if @stuffInBelly > 0
			@stuffInBelly = @stuffInBelly - 1
			@stuffInIntestine = @stuffInIntestine + 1
		else
			if @asleep
				@asleep = false
				puts "He wakes up suddenly!"
			end
			puts @name + " is starving! In desperation, he ate YOU!"
			exit
		end

		if @stuffInIntestine >= 10
			@stuffInIntestine = 0
			puts "Whoops! " + @name + " had an accident..."
		end

		if hungry?
			if @asleep
				@asleep = false
				puts "He wakes up suddenly!"
			end
			puts @name + "'s stomach grumbles..."
		end

		if poopy?
			if @asleep
				@asleep = false
				puts "He wakes up suddenly!"
			end
			puts @name + " does the potty dance..."
		end
	end

end

pet = Dragon.new "Drake"
exit = false

while exit == false
	action = gets.chomp.downcase

	if action == "feed"
		pet.feed
	elsif action == "walk"
		pet.walk
	elsif action == "put to bed"
		pet.putToBed
	elsif action == "toss"
		pet.toss
	elsif action == "rock"
		pet.rock
	elsif action == "exit"
		exit = true
	else
		puts "Could not compute. Try another command."
	end

end