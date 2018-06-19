class Coordinate
	attr_accessor :x
	attr_accessor :y
	def initialize(*args)
		if args.size == 1 # if one argument is passed, will generate random coordinate
			@x = rand(1..args[0])
			@y = rand(1..args[0])
		elsif args.size == 2 # if two argument is passed, will generate the coordinate
			@x = args[0]
			@y = args[1]
		else # else will be 0
			@x = 0
			@y = 0
		end
	end
end