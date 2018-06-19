class User 
	attr_accessor :coordinate
	def initialize(c)
		@coordinate = [c.x, c.y]
	end
end