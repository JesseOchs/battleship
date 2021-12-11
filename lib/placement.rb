require './lib/board'
require './lib/ship'
require './lib/cell'
class Placement

  attr_reader :letters, :nums
  def initialize(ship, coordinates)
    @letters = []
    @nums = []
    @ship = ship
    @coordinates = coordinates
  end

  def split_keys
    @coordinates.each do |coordinate|
      @letters << coordinate.split('').first
      @nums << coordinate.split('').last
    end
  end


   def valid_placement
     @ship.length == @coordinates.size
   end

end
