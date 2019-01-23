module Players
  class Computer < Player

    def move(board)
      move = nil
      corner = ["1", "3", "7", "9"]
      edge = ["2", "4", "6", "8"]

    #computer takes 5, unless it's taken
    if !board.taken?(5)
      move = "5"
    #if 5 is taken and computer is O, move to any corner:
    elsif board.turn_count == 1
      move = "1" # || "3" || "7" || "9" <- this is the right strategy, but the game crashes
    #if computer is X and O takes 1, move to 9:
  elsif board.turn_count == 2 && board.taken?(1)
      move = "9"
    #if computer is X and O takes 3, move to 7:
    elsif board.turn_count == 2 && board.taken?(3)
      move = "7"
    #if computer is X and O takes 7, move to 3:
    elsif board.turn_count == 2 && board.taken?(7)
      move = "3"
    #if computer is X and O takes 9, move to 1:
    elsif board.turn_count == 2 && board.taken?(9)
      move = "1"
    #if computer is O and started from 5, if X is in the opposite corners, move to 2.
    elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
      move = "2"
    #if you have 2/3 positions are taken, win if you can, or block the opponent:
    else
      Game::WIN_COMBINATIONS.detect do |combo|
        if combo.select{|index| board.position(index+1) == token}.size == 2 && combo.any?{|index| board.position(index+1) == " "}
          move = combo.select{|index| !board.taken?(index+1)}.first.to_i.+(1).to_s
        elsif combo.select{|index| board.position(index+1) != " " && board.position(index+1) != token}.size == 2 && combo.any?{|index| board.position(index+1) == " "}
          move = combo.select{|index| !board.taken?(index+1)}.first.to_i.+(1).to_s
        end
      end
    #if there is no winning combo available, move to either a corner or an edge
      move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
    #move = rand(1..9).to_s   <- cute, but less intelligent
      end
      move
    end
  end

end

# ---- CODE DUMPSTER ---- #

    #def winning_chance
      #combo.select{|index| board.position(index+1) == token}.size == 2 && combo.any?{|index| board.position(index+1) == " "}
    #end

    #def winning_move
      #combo.select{|index| !board.taken?(index+1)}.first.to_i.+(1).to_s
    #end

    #def block_chance
        #combo.select{|index| board.position(index+1) != " " && board.position(index+1) != token}.size == 2 && combo.any?{|index| board.position(index+1) == " "}
    #end

    #def block_move
      #combo.select{|index| !board.taken?(index+1)}.first.to_i.+(1).to_s
    #end
