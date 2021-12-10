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

end
