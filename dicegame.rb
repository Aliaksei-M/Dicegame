
def cls 
	system "cls" or system "clear"
end

def print_set(set) 
  	file_path = File.dirname(__FILE__)
  	 
	cls
	set.sort!
	set.each do |x|

		d = File.new(file_path + "/data/#{x}.txt")
		puts d.read
		d.close

	end
end


# roll the 5 dices
	set = []
	5.times do
		dice = rand(1..6)
		set << dice
	end

# Print result of roll

	print_set(set) 
	
# This is ok? N for reroll
	a = nil

	until a =="Y" || a =="N"
 
		puts "This is OK? Y/N"
		a=gets.chomp.upcase

		case a

		when "Y" 
			puts "OK"
			sleep 2

# Select dices for reroll

		when "N"
			puts "Select dices for reroll(input numbers without space): "
			ww = false
			until ww = true
				
				reroll =gets.chomp
					if reroll.count("1-5") == reroll.length
						ww = true
					end
			end
				# Нужна проверка, что введены цифры 1..5 без лишних символов.


					
					reroll = reroll.split("").map(&:to_i)
			#reroll selecteed dices	
					reroll.each {|i| set[i-1] = dice}
					sleep 2
		else 
			puts "'Y' or 'N' only"
		end
	end

# Print result
	
	print_set(set)


 # Считаем комбинацию. #todo



