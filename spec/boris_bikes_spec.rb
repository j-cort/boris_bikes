require './lib/dockingstation.rb'

describe DockingStation do 
    it "Docking Station has method of releasing a bike" do
        expect(subject).to respond_to :release_bike
    end
    it "Docking station creates an new bike when release_bike is called" do
    expect(subject.release_bike).to be_kind_of(Bike)
    end
    it 'returns true when asked if bike is working' do
    expect(subject.release_bike.working?).to eq (true)
    end
end