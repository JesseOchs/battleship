class Game
  def initialize
    @player = []
    @computer = []
    @board = Board.new
    @computer_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
  end

  def input
    input = gets.chomp
  end


  def start
    puts "Welcome to Battleship!"
    puts "Press p to play or q to quit."
    puts "*" * 40
    if input == 'p'
      @board.create_board
      @computer_board.create_board
      place_cruiser
    end
  end


  def place_cruiser
    puts "*" * 40
    puts 'Place your Cruiser in 3 coordinates, 1 coordinate at a time'
    puts @board.render
    coord_1 = input.to_s.upcase
    coord_2 = input.to_s.upcase
    coord_3 = input.to_s.upcase
    until @board.valid_placement?(@cruiser, [coord_1, coord_2, coord_3]) == true
      @board.clear
      place_cruiser
    end
      @board.place(@cruiser, [coord_1, coord_2, coord_3])
      @player << @cruiser
    place_sub
  end

  def place_sub
    @board.clear
    puts 'Place your Submarine in 2 coordinates, 1 coordinate at a time'
    puts @board.render(true)
    coord_4 = input.to_s.upcase
    coord_5 = input.to_s.upcase
    until @board.valid_placement?(@submarine, [coord_4, coord_5]) == true
      place_sub
    end
    @board.place(@submarine, [coord_4, coord_5])
      @player << @submarine
    computer_place_cruiser
  end

  def computer_randomizer(ship)
    @computer_board.clear
    random =  @computer_board.cells.keys.sample(ship.length)
    if @computer_board.valid_placement?(ship, random) == true
      return random
    else
      computer_randomizer(ship)
     end
  end

  def computer_place_cruiser
    placer = computer_randomizer(@computer_cruiser)
    @computer_board.place(@computer_cruiser, placer)
    @computer << @computer_cruiser
      computer_place_sub
  end

  def computer_place_sub
    sub = computer_randomizer(@computer_submarine)
    @computer_board.place(@computer_submarine, sub)
    @computer << @computer_submarine
    player_turn
  end

  def computer_shot
    shot =  @computer_board.cells.keys.sample(1)
    return shot
  end


  def player_turn
    puts "*" * 40
    puts 'Fire on a coordinate'
    puts @computer_board.render
    fire = input.to_s.upcase
    case
    when @board.valid_coordinate?(fire) == true then
      @computer_board.cells[fire].fire_upon
      puts @computer_board.render
    else
      player_turn
    end
    case
      when end_game? == true then winner
    else
      computer_turn
    end
  end

  def computer_turn
    puts "*" * 40
    puts 'Computers turn'
    @board.cells[computer_shot.first].fire_upon
    puts @board.render
    rounds
  end

  def sunk_ship?
    @player.delete_if {|ship| ship.sunk?}
    @computer.delete_if {|ship| ship.sunk?}
  end

  def end_game?
    sunk_ship?
    @player.count == 0 || @computer.count == 0
  end

  def rounds
    case
    when end_game? == true then winner
    else
      player_turn
    end
  end

  def winner
    puts "*" * 40
   if @player.count == 0
     puts "Bummer you lost!"
   else
     puts "Congrats you won!"
   end
   start
  end


end
