require './lib/ship'
require './lib/cell'


RSpec.describe Cell do
  it 'exists' do
    cell = Cell.new("B4")
    expect(cell).to be_an_instance_of(Cell)
  end

  it 'takes a coordinate as an argument' do
  cell = Cell.new("B4")
  expect(cell.coordinate).to eq('B4')
  end

  it 'has no ship yet' do
  cell = Cell.new("B4")
  expect(cell.ship).to eq nil
 end

 it 'has an empty cell' do
   cell = Cell.new("B4")
   expect(cell.empty?).to be true
 end

 it 'is a ship' do
   cruiser = Ship.new("Cruiser", 3)
   expect(cruiser).to be_an_instance_of(Ship)
 end

 it 'can have a ship placed in a cell' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    expect(cell.empty?).to be false
  end

  it 'returns false if a ship is in the cell but is not fired upon' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    expect(cell.fired_upon?).to be false
  end

  it 'can have a ship placed in a cell be fired upon' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon
    expect(cell.fired_upon?).to be true
 end

end
