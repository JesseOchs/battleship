require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe Board do

  it 'exists' do
    board = Board.new
    expect(board).to be_instance_of(Board)
  end

  it 'has cells in a hash' do
    board = Board.new
    expect(board.cells).to be_instance_of(Hash)
  end

  it 'has valid cells' do
    board = Board.new
    board.create_board
    expect(board.valid_coordinate?("A1")).to be true
    expect(board.valid_coordinate?("D4")).to be true
    expect(board.valid_coordinate?("A5")).to be false
    expect(board.valid_coordinate?("E1")).to be false
    expect(board.valid_coordinate?("A22")).to be false
  end

  xit '' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    # this test is not done being written
    expect(cruiser).to be_instance_of(Ship)
    expect(submarine).to be_instance_of(Ship)
  end

  xit 'placement length does not fit ship size' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    # this test is not done being written
    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to be false
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be false
  end

  xit 'coordinates are consecutive' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    # this test is not done being written
    expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to be false
    expect(board.valid_placement?(submarine, ["A1", "C1"])).to be false
    expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to be false
    expect(board.valid_placement?(cruiser, ["C1", "B1"])).to be false
  end

  xit 'coordinates are not diagonal' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    # this test is not done being written
    expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to be false
    expect(board.valid_placement?(submarine, ["C2", "D3"])).to be false
  end

  xit 'coordinates are not diagonal' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    # this test is not done being written
    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to be true
    expect(board.valid_placement?(submarine, ["B1", "C1", "D1"])).to be true
  end

  xit '' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])

  end

end
