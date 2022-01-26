
def cls 
	system "cls"
end

def print_set(set) 
  	file_path = File.dirname(__FILE__)
  	 
	cls
	print_dice = []
	set.sort!
	set.each do |x|

		d = File.new(file_path + "/data/#{x}.txt")
		puts d.read
		d.close

	end
	puts set.to_s
	# print print_dice
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


# Select dices for reroll

		when "N"
			puts "Select dices for reroll(numbers without space): "
				reroll =gets.chomp

				# Нужна проверка, что введены цифры 1..5 без лишних символов.

					puts "Input numbers of dice without space"
					
					reroll = reroll.split("").map(&:to_i)
				
					

					
 	
# Delete dices from set

			for i in 1..5 do
				if reroll.include?(i)

					set.delete_at(i-1)
				end
			end

 # Reroll selected dices

			(reroll.length).times do
	
				dice = rand(1..6)

				set << dice # put to set
			end
		else 
			puts "'Y' or 'N' only"
		end
	end

# Print result
	
	print_set(set)


 # Считаем комбинацию. #todo



