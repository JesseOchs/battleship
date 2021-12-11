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
      @nums << coordinate.split('').last.to_i
    end
  end


   def valid_placement?
    split_keys
    @ship.length == @coordinates.size &&
    @nums == @nums.sort &&
    @nums.last - @nums.first + 1 == @ship.length

   end

end
