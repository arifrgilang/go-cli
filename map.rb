class Map
	attr_reader :height
	attr_reader :width

	def initialize(n)
		@height = n
		@width = n
		@projection = Array.new(@height) { Array.new(@width) { "." }  }
	end

	def projection
		@projection.each { |x| puts x.each { |y| y }.join(" ")  }	
		nil
	end

	def addUser(user)
		@projection[user.x][user.y] = "#"
	end

	def addDrivers(drivers)
		drivers.each { |d|  @projection[d.x][d.y] = "#{d.name[0]}"}
	end
end