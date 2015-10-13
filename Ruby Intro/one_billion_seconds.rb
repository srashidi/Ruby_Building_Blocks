puts "On " + (Time.mktime(1988,12,30,12,8) + 1000000000).to_s + ", I will be one billion seconds old." 
puts "I am currently " + (Time.new - Time.mktime(1988,12,30,12,8)).to_s + " seconds old."