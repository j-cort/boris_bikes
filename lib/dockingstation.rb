require_relative "./bike.rb"

class DockingStation

    attr_reader :stored_bikes
    attr_reader :capacity
    DEFAULT_CAPACITY = 20

    def initialize(capacity = DEFAULT_CAPACITY)
        @stored_bikes = []
        @capacity = capacity
    end
    
    def release_bike
        if empty?
            raise "There are no bikes!"
        else
            return Bike.new
        end
    end

    private 

    def empty? 
        @stored_bikes.empty?
    end

    def full?
        @stored_bikes.count >= DEFAULT_CAPACITY
    end

    public

    def store(bike)
        if full?
            raise "Bike rack full!"
        end
        @stored_bikes.push(bike)
    end
end