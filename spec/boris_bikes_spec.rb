require './lib/dockingstation.rb'

describe DockingStation do 
    it "Docking Station has method of releasing a bike" do
        expect(subject).to respond_to :release_bike
    end
    it "Docking station creates an new bike when release_bike is called" do
    bike = Bike.new
    dockingstation = DockingStation.new
    dockingstation.store(bike)    
    expect(dockingstation.release_bike).to be_kind_of(Bike)
    end
    it 'returns true when asked if bike is working' do
    bike = Bike.new
    dockingstation = DockingStation.new
    dockingstation.store(bike)    
    expect(dockingstation.release_bike.working?).to eq (true)
    end
    it "Docking Station has method of storing a bike" do
        expect(subject).to respond_to(:store).with(1).argument
    end
    it "Allows a bike to be stored" do
        bike = Bike.new
        dockingstation = DockingStation.new
        expect(dockingstation.store(bike).include?(bike)).to eq(true)
    end

    it "Raises an error when bike is requested when are no bikes" do
        expect{subject.release_bike}.to raise_error
    end

    it "Raises an error when more than 1 bike is tried to be stored" do
        bike = Bike.new
        bike2 = Bike.new
        dockingstation = DockingStation.new
        dockingstation.store(bike)   
        expect{dockingstation.store(bike2)}.to raise_error
    end
end