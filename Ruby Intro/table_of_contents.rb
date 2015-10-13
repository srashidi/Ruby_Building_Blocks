lineWidth = 50
chapters = ['Chapter 1: Numbers','Chapter 2: Letters','Chapter 3: Variables']
pages = [1,72,118]

puts "Table of Contents".center(lineWidth)
puts
i=0
while i < pages.length
	puts chapters[i].ljust(lineWidth/2) + "page #{pages[i]}".rjust(lineWidth/2)
	i += 1
end