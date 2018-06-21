class Route
	attr_reader :get
	attr_reader :distance
	attr_reader :routeArray

	# Take User Obj and Coordinate
	def initialize(user, destination)
		pointer = []
		route = []
		pointer.push(*user.coordinate.get)
		res = ["- Start at #{pointer}"]
		
		## This will generate the array of string
		## For the history that will be put into the history file
		# 1
		if user.coordinate.x < destination.x
			(destination.x - user.coordinate.x).times do
				pointer[0] = pointer[0] += 1
				res.push("- Go to #{pointer}")
				route.push([pointer[0],pointer[1]])
			end
			# 2
			if user.coordinate.y < destination.y
				res.push("- Turn left")
				(destination.y - user.coordinate.y).times do
					pointer[1] = pointer[1] += 1
					res.push("- Go to #{pointer}")
					route.push([pointer[0],pointer[1]])
				end
			elsif user.coordinate.y > destination.y
				res.push("- Turn Right")
				(user.coordinate.y - destination.y).times do
					pointer[1] = pointer[1] -= 1
					res.push("- Go to #{pointer}")
					route.push([pointer[0],pointer[1]])
				end
			else

			end
		# 1
		elsif user.coordinate.x > destination.x
			(user.coordinate.x - destination.x).times do
				pointer[0] = pointer[0] -= 1
				res.push("- Go to #{pointer}")
				route.push([pointer[0],pointer[1]])
			end
			#2
			if user.coordinate.y < destination.y
				res.push("- Turn Right")
				(destination.y - user.coordinate.y).times do
					pointer[1] = pointer[1] += 1
					res.push("- Go to #{pointer}")
					route.push([pointer[0],pointer[1]])
				end
			elsif user.coordinate.y > destination.y
				res.push("- Turn Left")
				(user.coordinate.y - destination.y).times do
					pointer[1] = pointer[1] -= 1
					res.push("- Go to #{pointer}")
					route.push([pointer[0],pointer[1]])
				end
			else

			end
		else
			if user.coordinate.y < destination.y
				(destination.y - user.coordinate.y).times do
					pointer[1] = pointer[1] += 1
					res.push("- Go to #{pointer}")
					route.push([pointer[0],pointer[1]])
				end
			elsif user.coordinate.y > destination.y
				(user.coordinate.y - destination.y).times do
					pointer[1] = pointer[1] -= 1
					res.push("- Go to #{pointer}")
					route.push([pointer[0],pointer[1]])
				end
			else

			end
		end
		# 1
		res.push("- Finish at #{pointer}")

		@get = res
		@distance = generateDistance(user, destination)
		@routeArray = route
	end

	# This will generate the distance based on the route
	def generateDistance(u, d)
		(u.coordinate.x - d.x).abs + (u.coordinate.y - d.y).abs
	end
end