module Players
  class Computer < Player

    def move(board)
      move = nil
      corner = ["1", "3", "7", "9"]
      edge = ["2", "4", "6", "8"]

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

    #if computer is X start taking 5, if it's O and 5 is not taken, take 5:
    if !board.taken?(5)
    move = "5"
    #if 5 is taken and computer is O, move to any corner:
    elsif board.turn_count == 1
    move = corner.sample
    #if computer is X and O takes any edge, move to any corner:

    #if computer is X and O takes 1, move to 9:
  elsif board.turn_count == 2 && board.position(1)
    move = "9"
    #if computer is X and O takes 3, move to 7:
    elsif board.turn_count == 2 && board.position(3)
    move = "7"
    #if computer is X and O takes 7, move to 3:
    elsif board.turn_count == 2 && board.position(7)
    move = "3"
    #if computer is X and O takes 9, move to 1:
    elsif board.turn_count == 2 && board.position(9)
    move = "1"
    #if computer is O and started from 5, if X is in the opposite corners, move to 2.
  elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
    move = "2"
    #from now on try to win or block the move:
  else
      Game::WIN_COMBINATIONS.detect do |cmb|

        # First, check whether you have any chances to win, since it doesn't matter whether the opponent has a chance to win if you can win first.
        if combo.select{|index| board.position(index+1) == token}.size == 2 && combo.any?{|index| board.position(index+1) == " "}
          move = combo.select{|index| !board.taken?(index+1)}.first.to_i.+(1).to_s

        # If you can't play any winning moves, play a move to block the opponent from winning.
        elsif cmb.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
          move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
        end
      end

      # If none of the WIN_COMBINATIONS patterns have two squares taken by the same token and a third empty square, play into the first open square you find, first checking corners and then checking sides.
      move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
    end #else
    move
  end #move definition
end #class
  end #module
