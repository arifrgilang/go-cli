require_relative "user"
require_relative "driver"
require_relative "coordinate"
require_relative "format"
require_relative "map"

class MapGenerator
	attr_accessor :map
	attr_accessor :drivers
	attr_accessor :user

	def initialize
		@map = 0
		@drivers = 0 
		@user = 0
	end

	# This is the main machine to process ARGV given by user
	def generate(args) 
		# If no argument is given
		if args.size == 0 
			@drivers = drawRandomDrivers(5, 20)
			@user = drawRandomUser(20)

			gmap(20)

		# If format.txt as an argument	
		elsif args.size == 1 
			# Translating the format.txt
			data = Format.new(args[0]) 
	
			@drivers = data.drivers
			@user = data.user

			gmap(data.mapsize)

		# If Argument is not as the program wanted, Throw error	
		elsif args.size == 2 || args.size > 3
			raise ArgumentError, 'Wrong arguments'

		#If 3 or more arguments is given 	
		else 
			raise ArgumentError, 'First argument must higher than 2' if args[0].to_i < 3
			@drivers = drawRandomDrivers(5, args[0].to_i)
			@user = User.new(Coordinate.new(args[1].to_i, args[2].to_i))

			gmap(args[0].to_i)
		end
	end

	# This method is for adding the thing into the map
	def gmap(mapsize)
		@map = Map.new(mapsize)
		@map.addDrivers(@drivers)
		@map.addUser(@user)
	end

	# This drawing user with random Position
	def drawRandomUser(mapsize)
		a = User.new(Coordinate.new(mapsize))
		a
	end

	#  This is drawing n drivers according to mapsize tho
	def drawRandomDrivers(n, mapsize)
		# This is to prevent duplicate in Name and Coordinate
		drivers = {}
		while drivers.size < n
			candidate = Driver.new(Coordinate.new(mapsize))
			if drivers.key?(candidate.name) || drivers.has_value?([candidate.x, candidate.y])

			else	
				drivers[candidate.name] = [candidate.x, candidate.y]
			end
		end

		# Changing the hash value into Driver Object
		result = {}
		drivers.each do |key, val| 
			result[key] = Driver.new(Coordinate.new(mapsize))
			# result[key].coordinate = val
			result[key].coordinate = Coordinate.new(val[0],val[1])
			result[key].x = val[0]
			result[key].y = val[1]
			result[key].name = key 
		end

		# Returned as Array of Driver Object
		result.values
	end

	# This will generate the nearest driver
	def getNearestDriver
		nearestDriver = nil
		nearestDistance = 99999
		u = @user.coordinate
		@drivers.each do |d|
			dRadius = (u.x - d.coordinate.x).abs + (u.y - d.coordinate.y).abs
			if dRadius < nearestDistance
				nearestDistance = dRadius
				nearestDriver = d 
			end
		end
		nearestDriver
	end
end
