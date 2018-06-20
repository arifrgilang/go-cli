class History
	attr_accessor :order
	attr_accessor :destination

	# Take MapGenerator Object as argument
	def initialize(gocli)
		@order = nil
		@destination = nil
		@gocli = gocli
		@total = 0
	end

	# Putting Format History into history.txt
	def put
		@total = @total + 1
		arr = ["<|#{@total}|"]
		arr.push("|From-#{@gocli.user.coordinate.get}-to-#{@destination.get}")
		arr.push("|Map-size=#{@gocli.map.height}*#{@gocli.map.height}")
		arr.push("|Driver's-Name=#{@order.driver.name}")
		arr.push("|Distance-Traveled=#{@order.route.distance}-unit")
		arr.push("|Total-Price=#{@order.totalPriceTo(@destination)}")
		arr.push("|Route=")
		arr.push(*order.route.get)
		arr.push(">")
		File.open("history.txt", "a") do |f|
			f.puts(arr)
		end
		nil
	end

	# Read all history inside history.txt
	def readHistory
		result = ""
		if File.zero?("history.txt")
		
		else
			history = File.read("history.txt")
			result = history
		end
		result
	end

	# Clearing all history data from history.txt
	def clearHistory
		File.truncate("history.txt",0)
	end
end
