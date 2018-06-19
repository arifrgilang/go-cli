class Driver
	attr_accessor :coordinate
	attr_reader :name
	def initialize(c)
		names = ["Arif", "Bimo", "Cece", "Deri", "Eman", "Fakhri", 
			"Gilang", "Hasbi", "Ihsan", "Joni", "Kris", "Lina", 
			"Mirza", "Nana", "Ojan", "Pasha", "Qonit", "Rizki", 
			"Surya", "Temon", "Ujang", "Vinka", "Wawan", "Xero", 
			"Yadi", "Zandi"]
		@coordinate = [c.x, c.y]
		@name = names.sample
	end
end