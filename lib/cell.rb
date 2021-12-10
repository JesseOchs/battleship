class Cell

  attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship_object)
    @ship = ship_object
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = !@fired_upon
  end

  def render(show_ship = false)
    if show_ship == false && @fired_upon == true && @ship == nil
      "M"
    elsif show_ship == true && @ship !=nil && @fired_upon == false
      "S"
    elsif show_ship == false && @fired_upon == true && @ship != nil
      "H"  
    else
      "."
    end

  end



end
