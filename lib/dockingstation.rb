require_relative "./bike.rb"

class DockingStation

    def release_bike
        return Bike.new
    end

    def store(bike)
        @stored_bikes = []
        @stored_bikes << bike
        puts @stored_bikes
    end
end