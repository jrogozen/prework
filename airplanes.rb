class Airplane

	@@city_to_airplane_hash = {}

	def initialize (city, capacity)
		@city = city
		@capacity = capacity

		if @@city_to_airplane_hash.has_key?(@city)
			puts "There is already an airplane in #{city}. Please type a new city."
			until !@@city_to_airplane_hash.has_key?(@city)
				print ">>"
				@city = gets.chomp
			end
			@@city_to_airplane_hash[city] = self
			puts "New airplane added to #{@city}."
		else
			@@city_to_airplane_hash[city] = self
			puts "New airplane added to #{@city}."
		end
	end

	def fly_to_city (city)
		if @@city_to_airplane_hash.has_key?(city)
			puts "Sorry, there is already an airplane in #{city}."
		else
			# delete current airplane
			@@city_to_airplane_hash.delete(@city)
			puts "Airplane has left #{@city}."

			# add to new city
			@@city_to_airplane_hash[city] = self
			puts "Airplane has successfully arrived at #{city}."
		end
	end

end

a = Airplane.new("SF", 100)
b = Airplane.new("SF", 200)