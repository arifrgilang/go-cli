class Map
	attr_reader :height
	attr_reader :width

	# Take integer as the size of the map
	def initialize(n)
		@height = n
		@width = n
		@projection = Array.new(@width) { Array.new(@height) { "." }  }
	end

	# Print map into the screen
	def projection 
		y = @height
		batas = @height
		print "y"
		while y >= 0
		 	x = 0
		 	print "| " if y< @height
			while x < batas
			print "#{@projection[x][y]} "
				x+=1
			end
			puts ""
			y-=1
		end
		puts "0-" + "=-" * batas + "x"

		nil
	end

	# Adding user position into the map
	def addUser(user)
		@projection[user.x - 1 ][user.y - 1] = "#"
	end

	# Removing user position from the map (In case user traveling)
	def removeUser(user)
		@projection[user.x - 1 ][user.y - 1] = "."
	end

	# Adding drivers position into the map
	def addDrivers(drivers)
		drivers.each { |d|  @projection[d.coordinate.x - 1][d.coordinate.y - 1] = "#{d.name[0]}"}
	end
end
