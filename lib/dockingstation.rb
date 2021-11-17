require_relative "./bike.rb"

class DockingStation

    attr_reader :stored_bikes

    def initialize
        @stored_bikes = []
    end
    
    def release_bike
        if @stored_bikes.empty?
            raise "There are no bikes!"
        else
            return Bike.new
        end
    end

    def store(bike)
        if @stored_bikes.count >= 20
            raise "Bike rack full!"
        end
        @stored_bikes.push(bike)
    end
end