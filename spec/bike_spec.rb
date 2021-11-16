require './lib/bike.rb'

describe Bike do
  it 'Bike has method of checking if working?' do
    expect(subject).to respond_to :working?
  end
end