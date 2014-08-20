class Airplane
	attr_accessor :city

	@@city_to_airplane_hash = Hash.new([])
	@@flight_plans = {}
	#{airplane => city}

	def self.list_airplanes
		p @@city_to_airplane_hash
	end

	def initialize (city, capacity)
		@city = city
		@capacity = capacity
		@people_on_plane = 0

		@@city_to_airplane_hash[@city] += [self]
	end

	def fly_to_city (city)
		# delete current airplane
		@@city_to_airplane_hash[@city].delete(self)
		puts "Airplane has left #{@city}."

		# add to new city
		@@city_to_airplane_hash[city] += [self]
		self.city = city
		puts "Airplane has successfully arrived at #{city}."
	end

	def book_flight (city)
		# is flight already going somewhere else?
		if @@flight_plans[self].nil? || @@flight_plans[self] == city
			@@flight_plans[self] = city

			# update plane count
			if @people_on_plane + 1 <= @capacity
				@people_on_plane += 1
				puts "Flight to #{city} successfully booked."
			else
				puts "Sorry, flight is at maximum capacity."
			end
		else
			puts "Sorry, flight is scheduled to go to a different city."
		end

	end
end

a = Airplane.new("SF", 2)
b = Airplane.new("SF", 2)
c = Airplane.new("LA", 2)

a.fly_to_city("LA")
a.fly_to_city("MIN")
a.fly_to_city("SF")
Airplane.list_airplanes
a.book_flight("LA")
a.book_flight("SF")
a.book_flight("LA")
a.book_flight("LA")
