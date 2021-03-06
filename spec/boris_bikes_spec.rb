require './lib/dockingstation.rb'

describe DockingStation do 
    it "Docking Station has method of releasing a bike" do
        expect(subject).to respond_to :release_bike
    end
    it "Docking station creates an new bike when release_bike is called" do
    bike = double(:bike)
    dockingstation = DockingStation.new
    dockingstation.store(bike)    
    expect(dockingstation.release_bike).to be_kind_of(Bike)
    end
    it 'returns true when asked if bike is working' do
    bike = double("bike", :working? => true, :report => false)
    dockingstation = DockingStation.new
    dockingstation.store(bike)    
    expect(dockingstation.release_bike.working?).to eq (true)
    end
    it "Docking Station has method of storing a bike" do
        expect(subject).to respond_to(:store).with(1).argument
    end
    it "Allows a bike to be stored" do
        bike = double(:bike)
        dockingstation = DockingStation.new
        expect(dockingstation.store(bike).include?(bike)).to eq(true)
    end

    it "Raises an error when bike is requested when are no bikes" do
        
        expect{subject(0).release_bike}.to raise_error
    end

    it "Raises an error when more than 20 biked is tried to be stored" do
        dockingstation = DockingStation.new        
        (dockingstation.capacity/2).times { dockingstation.store double(:bike) }
        expect{dockingstation.store(double(:bike))}.to raise_error
    end

    it "Allows capacity to be set upon creation" do
        dockingstation = DockingStation.new(22)
        expect(dockingstation.capacity).to eq(22)
    end

    it "Default capacity is set to 20" do
        dockingstation = DockingStation.new
        expect(dockingstation.capacity).to eq(20)
    end

    it "allows a bike to be reported as not working" do
        station = DockingStation.new
        bike = double("bike", :working? => false, :report => false)
        station.store(bike, "broken")
        expect(bike.working?).to eq false
    end
    it "aceepts broken and working bikes" do
        station = DockingStation.new
        bike = double("bike", :working? => true, :report => false)
        expect(station.store(bike, "broken").include?(bike)).to eq(true)
    end
    it "does not release broken bikes" do
        station = DockingStation.new
        bike = double("bike", :working? => true, :report => false)
        station.store(bike, "broken")
        expect(station.release_bike.working?).to eq true 
    end
end