class Coordinate
	attr_accessor :x
	attr_accessor :y
	attr_accessor :get

	def initialize(*args)
		# if one argument is passed, will generate random coordinate with mapsize as limit
		if args.size == 1 
			@x = rand(1..args[0]).to_i
			@y = rand(1..args[0]).to_i

		# if two argument is passed, will generate the coordinate
		elsif args.size == 2 
			@x = args[0].to_i
			@y = args[1].to_i

		# else will Throw SyntaxError
		else 
			raise SyntaxError, 'empty argument'
		end
		
		@get = [@x, @y]
	end
end
