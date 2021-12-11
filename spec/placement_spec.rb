require 'pry'
require './lib/placement'
require './lib/ship'

RSpec.describe Placement do
  it 'exists' do
  cruiser = Ship.new("Cruiser", 3)
  coordinates = ["A1", "A2", "A3"]
  placement = Placement.new(cruiser, coordinates)
  expect(placement).to be_instance_of(Placement)
  end

  it 'places Cruiser correctly ' do
    cruiser = Ship.new("Cruiser", 3)
    coordinates = ["A1", "A2", "A3"]
    placement = Placement.new(cruiser, coordinates)
    placement.split_keys
    expect(placement.valid_placement?).to be true
  end

 it 'places Cruiser incorrectly ' do
   cruiser = Ship.new("Cruiser", 3)
   coordinates = ["A1", "A2"]
   placement = Placement.new(cruiser, coordinates)
   expect(placement.valid_placement?).to be false
 end

 it 'places Submarine incorrectly ' do
   submarine = Ship.new("Submarine", 2)
   coordinates = ["A2", "A3", "A4"]
   placement = Placement.new(submarine, coordinates)
   expect(placement.valid_placement?).to be false
 end

 it 'places Cruiser consecutively' do
   cruiser = Ship.new("Cruiser", 3)
   coordinates = ["A1", "A2", "A4"]
   placement = Placement.new(cruiser, coordinates)
   placement.split_keys
   expect(placement.valid_placement?).to eq false
 end

 xit 'places Submarine consecutively' do
   submarine = Ship.new("Submarine", 2)
   coordinates = ["A1", "C1"]
   placement = Placement.new(submarine, coordinates)
   placement.split_keys
   expect(placement.valid_placement?).to be false
 end

 xit 'places Cruiser consecutively backwards' do
   cruiser = Ship.new("Cruiser", 3)
   coordinates = ["A3", "A2", "A1"]
   placement = Placement.new(cruiser, coordinates)
   placement.split_keys
   expect(placement.valid_placement?).to eq false
 end

 xit 'places Submarine consecutively backwards' do
   submarine = Ship.new("Submarine", 2)
   coordinates = ["C1", "B1"]
   placement = Placement.new(submarine, coordinates)
   placement.split_keys
   expect(placement.valid_placement?).to be false
 end

 xit 'places Cruiser diagonally' do
   cruiser = Ship.new("Cruiser", 3)
   coordinates = ["A1", "B2", "C3"]
   placement = Placement.new(cruiser, coordinates)
   placement.split_keys
   expect(placement.valid_placement?).to eq false
 end

 xit 'places Submarine diagonally' do
   submarine = Ship.new("Submarine", 2)
   coordinates = ["C2", "D3"]
   placement = Placement.new(submarine, coordinates)
   placement.split_keys
   expect(placement.valid_placement?).to be false
 end

 xit 'places Submarine valid' do
   submarine = Ship.new("Submarine", 2)
   coordinates = ["A1", "A2"]
   placement = Placement.new(submarine, coordinates)
   placement.split_keys
   expect(placement.valid_placement?).to be true
 end

 xit 'places Cruiser valid' do
   cruiser = Ship.new("Cruiser", 3)
   coordinates = ["B1", "C1", "D1"]
   placement = Placement.new(cruiser, coordinates)
   placement.split_keys
   expect(placement.valid_placement?).to eq true
 end



end
