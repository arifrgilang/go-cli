class Order
	attr_accessor :driver
	attr_accessor :user
	attr_accessor :price
	attr_accessor :route

	# This order made for saving the route, price, user, driver, 
	# Later on will be put into history
	def initialize(driver, user, price, route)
		@driver = driver
		@user = user
		@price = price
		@route = route
	end

	# Return total price to destination given
	def totalPriceTo(dest)
		((dest.x - @user.coordinate.x).abs + (dest.y - @user.coordinate.y).abs) * @price
	end
end
