class Driver
	attr_accessor :x
	attr_accessor :y
	attr_accessor :name
	attr_accessor :coordinate

	def initialize(c)
		# List of names from [A-Z], will randomly be taken to set as drivers name
		names = ["Arif", "Bimo", "Cece", "Deri", "Eman", "Fakhri", 
			"Gilang", "Hasbi", "Ihsan", "Joni", "Kris", "Lina", 
			"Mirza", "Nana", "Ojan", "Pasha", "Qonit", "Rizki", 
			"Surya", "Temon", "Ujang", "Vinka", "Wawan", "Xero", 
			"Yadi", "Zandi"].sample
		@coordinate = c
		@x = c.x
		@y = c.y
		@name = names
	end
end
