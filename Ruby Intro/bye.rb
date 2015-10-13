command = ''

while command != 'bye'
  command = gets.chomp
  if command != 'bye'
  	puts command
  end
end

puts 'Come again soon!'