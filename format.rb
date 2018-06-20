# Format File #

# mapsize 20 					##means: mapsize is 20
# user_coordinate 3,3 			##means: user coordinate is (3,3)
# drivers Agus-1,2 Bima-9,16 	##means: format driver is: drivername-x,y

require_relative "driver"
require_relative "coordinate"

class Format
	attr_reader :mapsize
	attr_reader :user
	attr_reader :drivers

	# Arguments for initialize is the file name
	def initialize(filename) 
		@mapsize = translate(filename, "mapsize") # Integer
		@user = translate(filename, "user") # User Object
		@drivers = translate(filename, "drivers") # Array of Driver Object
	end

	# Translates the format inside the text file
	def translate(filename, what) 
		result = 0
		# Read the text and convert to array of arr
		arr = File.read(filename).split(" ") 

		# What to translate?
		case what 
		when "mapsize"
			# Take mapsize from the textfile
			result = arr[1].to_i 
			
		when "user"
			# Take user coordinate, and convert it into User Object
			a = arr[3].split(",").map(&:to_i)
			result = User.new(Coordinate.new(a[0],a[1]))
			
		when "drivers"
			# Take driver(s) and assign it all into an Array
			result = []
			arr[5..-1].each do |x| 
				arrC = x.split("-")[1].split(",").map(&:to_i)
				c = Coordinate.new(arrC[0], arrC[1]) 
				d = Driver.new(c)
				d.name = x.split("-")[0]
				result.push(d)
			end
		end
		result
	end
end
