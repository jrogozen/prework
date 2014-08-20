def calculator_1(operator, num1, num2)
    # TODO: perform the operator on num1 and num2
    # Example: calculator('*', 5, 6) should return 30
    case operator
    when '*'
    	num1 * num2
    when '+'
    	num1 + num2
    when '-'
    	num1 - num2
    when '/'
    	num1 / num2.to_f
    end
end   

def is_movie_available_1(name)
	movies = ["Thor", "Captain America", "Hulk", "Iron Man"]
    # TODO: return whether or not the movie given is being played
    movies.include? name
end

def is_movie_available_2(name, time)
	movie_timings = {
		"Thor" => [100, 400, 600, 1200, 1400, 1830],
		"Captain America" => [400, 845, 1115, 1430, 1940, 2130, 2300],
		"Hulk" => [ 1200, 1500, 1830, 2200],
		"Iron Man" => [1315, 1645]
	}
    # TODO: return true if the movie is being played and if it starts at the time given
    movie_timings.each do |movie, times|
    	if movie == name
    		p times.include?(time) ? true : false
    	end
    end
end

def is_movie_available_3(name, time)
    # TODO: Return the first movie timing that the user can go to for the given movie name
    movie_timings = {
    	"Thor" => [100, 400, 600, 1200, 1400, 1830],
    	"Captain America" => [400, 845, 1115, 1430, 1940, 2130, 2300],
    	"Hulk" => [ 1200, 1500, 1830, 2200],
    	"Iron Man" => [1315, 1645]
    }
    movie_timings[name].each do |hour|
    	if hour > time
    		return hour
    	end
    end
end

def is_movie_available_4(time)
    # TODO: Return a dictionary of movies being played mapped to a list of movie timings
    # that the user can go to
    # Only add the move as a key if a proper timing is available
    movie_timings = {
    	"Thor" => [100, 400, 600, 1200, 1400, 1830],
    	"Captain America" => [400, 845, 1115, 1430, 1940, 2130, 2300],
    	"Hulk" => [ 1200, 1500, 1830, 2200],
    	"Iron Man" => [1315, 1645]
    }
    movies = {}
    # YOUR CODE
    # movie_timings.each do |name, hours|
    # 	hours.each do |hour|
    # 		if hour > time
    # 			p name
    # 			p hour
    # 			movies[name].nil? ? movies[name] = [].push(hour) : movies[name] << hour
    # 		end
    # 	end
    # end
    movie_timings.each do |movie_title, movie_times|
        available_times = movie_times.select {|t| t >= time}
        movies[movie_title] = available_times
    end
    return movies
end

##############
## classes ##
###########

class Chimpanzee
	def initialize
		@bananas = 0
		@is_clean = true
	end
	def yell
		puts "RAWRAWRAWR"
	end
	def eat
		puts "mnm. banana!"
		@bananas += 1
		@is_clean = false
	end
	def eat_count
		puts "#{@bananas} eaten."
	end
	def groom
		if @is_clean
			puts "There's nothing to do."
		else
			puts "Takin' a shower."
			@is_clean = true
		end
	end
end

class Roommate
    attr_accessor :name

    @@total_beer_count = 0
    @@total_students = 0
    @@roommates = []

    def self.total_beer_count
        puts "#{@@total_beer_count} beers have been drunk."
    end
    def self.average_beers
        average = @@total_beer_count.to_f / @@total_students
        puts "On average, each student drank #{average} beers."
    end
    def self.take_a_round
        @@roommates.each do |person|
            puts "#{person.name} drinks a beer."
            person.drink_beer
        end
    end

    def initialize (name)
        @name = name
        @beer_count = 0
        @@total_students += 1
        @@roommates << self
    end
    def drink_beer
        puts "Yum."
        @beer_count += 1
        @@total_beer_count += 1 
    end
end

jon = Roommate.new("Jon")
syd = Roommate.new("Syd")
howard = Roommate.new("Howard")
kim = Roommate.new("Kim")

jon.drink_beer
howard.drink_beer
Roommate.total_beer_count
Roommate.average_beers
Roommate.take_a_round
Roommate.average_beers