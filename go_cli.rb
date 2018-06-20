require_relative "map_generator"
require_relative "coordinate"
require_relative "order"
require_relative "route"
require_relative "history"

*args = ARGV
system "cls"


# The generator to handle map according to arguments given by user
gocli = MapGenerator.new
gocli.generate(args)
# Create History Obj
history = History.new(gocli)
history.clearHistory


# Menu
while true 
	puts "======== Go-CLI App ======="
	puts "|                         |"
	puts "| What do you want to do? |"
	puts "|                         |"
	puts "|    1 - Show Map         |"
	puts "|    2 - Order Go-Ride    |"
	puts "|    3 - View History     |"
	puts "|    4 - Quit             |"
	puts "|                         |"
	puts "==========================="
	print " > " 
	choice = $stdin.gets.chomp.to_i

	# Option 1, 2, 3
	case choice
	when 1 
		system "cls"
		gocli.map.projection # This method will print the map
		puts ""
		## THIS IS TO DISPLAY USER AND DRIVERS POSITIONS ##
		# gocli.drivers.each {|driver| puts "|#{driver.name} - #{driver.coordinate.get}" } 
		# puts ""
		# puts "|User position: #{gocli.user.coordinate.get}"
	when 2
		# This take input for destination, and make it into Coordinate obj
		# And generate a Route from user current position
		print "|Put destination (ex: 1,1) : "
		des = $stdin.gets.to_s.chomp.split(",").map(&:to_i)

		if (des[0] < 1 || des[0] > gocli.map.height) || (des[1] < 1 || des[1] > gocli.map.height)
			puts "Destination out of range"
			puts "Program quitting ..."
			break
		end
		destination = Coordinate.new(des[0],des[1])
		route = Route.new(gocli.user, destination)
		
		# This method will find and return the nearest Driver obj
		# Generate Order obj for handling Order
		nearest = gocli.getNearestDriver
		order = Order.new(nearest, gocli.user, 300, route)
		history.order = order
		history.destination = destination
		
		puts "=" * 37 # Just a separator

		# Display from confirming order
		puts "|Driver Found   : #{order.driver.name}"
		puts "|Travel from    : #{gocli.user.coordinate.get} to #{destination.get}"
		puts "|Price estimate : #{order.totalPriceTo(destination)}"
		print "|Confirm order [y,n] ? "

		confirmation = $stdin.gets.to_s.chomp.downcase
		if confirmation == "y"
			# Put the trip to history.txt
			history.put
			# Move the user coordinate to destination
			# newMap = MapGenerator.new
			# newMap.drivers = gocli.drivers
			# newMap.user = User.new(destination)
			gocli.map.removeUser(gocli.user)
			gocli.user = User.new(destination)
			gocli.map.addDrivers(gocli.drivers)
			gocli.map.addUser(gocli.user)
			
			puts "=" * 37 # Just a separator

			puts "|You traveled to #{destination.get}"
			puts "|Trip Completed!"
			puts "|Trip history has been saved"
			pause = $stdin.gets.to_s.chomp.split(",").map(&:to_i)
			system "cls"
		else
			# Loop again if trip not confirmed
			system "cls"
		end
	when 3
		system "cls"
		puts history.readHistory
	when 4
		puts "Thanks for using Go-CLI !"
		break
	else 
		# if user input anything beside 0-3
		puts "Wrong Input"
		puts "Program quitting ..."
		break
	end
end