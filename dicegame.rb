
def cls 
	system "cls" or system "clear"
end

def dice
	rand(1..6)
end

def print_set(set) 
  	file_path = File.dirname(__FILE__)
  	 
	set.sort!
	set.each do |x|
		d = File.new(file_path + "/data/#{x}.txt")
		puts d.read
		d.close
	end
end

def reroll_dices(set)

	reroll_ask = nil

	until reroll_ask =="Y" || reroll_ask =="N"
 
		puts "Do you want to reroll dices? Y/N"
		reroll_ask=gets.chomp.upcase

		case reroll_ask

		when "N" 
			puts "OK"
			sleep 2

# Select dices for reroll

		when "Y"
			puts "Select dices for reroll(input numbers without space): "
			ww = false
			until ww == true
						
				reroll = gets.chomp
					if reroll.count("1-5") == reroll.length
						ww = true
					else
						puts "Input numbers 1-5 only:"
					end
			end
				
					reroll = reroll.split('').map(&:to_i)
			#reroll selected dices	
					reroll.each {|i| set[i-1] = dice}
					sleep 2
			# print_set(set)
			# reroll_dices(set)		
		else 
			puts "Input 'Y' or 'N' only"
		end
	
	end






	return set
end

# roll the 5 dices
	set = []
	5.times do
		set << dice
	end

# Print result of roll
	puts "Your combination:"
	print_set(set) 
	
# This is ok? reroll
	
reroll_dices(set)
		
# Print final result
cls
	puts "Final result:"
	print_set(set)
	
 # Считаем комбинацию. #todo



