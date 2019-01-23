class Board
  attr_accessor :cells


  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " * * * * * * *"
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    puts "* * * * * * *"
  end

  def position(input)
      cells[input.to_i-1]
  end

  def full?
    cells.all? do |position|
      position == "X" || position == "O"
    end
  end

  def turn_count
    counter = 0
    cells.each do |position|
      if position == "X" || position == "O"
        counter +=1
      end
    end
    counter
  end

  def taken?(input)
    if position(input) == "X" || position(input) == "O"
      true
    else
      false
    end
  end

  def valid_move?(input)
    if !taken?(input) && (1..9).include?(input.to_i)
      true
    end
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
  end

end
