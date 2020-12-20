class TicTacToe
 
def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7 ,8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4 ,8],
    [2, 4 ,6]
]

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
    input.to_i - 1
end

def move(index, current_player)
    @board[index] = current_player
    
end

def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
end

def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
end

def turn_count
counter = 0 
    @board.each do |i|
        if i == "X" || i == "O"
counter += 1
        end
    end
counter
end

def current_player
    return "X" if turn_count.even?
    return "O" if turn_count.odd?
end

def turn
puts "Please enter position 1-9."
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
        token = current_player
        move(index, token)
    else
        turn
    end
display_board
end

#def won?
 #empty = @board.none? { |i| i == "X" || i = "O"}
 #if empty
    #false
 #else
    #WIN_COMBINATIONS.each do |win_combo|
        #if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X" 
           #@board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
           # return win_combo
       # end
  #  end
   # return false
#end 
#end
#could this be messing up my other methods? Causing the no "O" problem?

def won?
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
        return win_combo
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return win_combo
      end
        false
    end
  end















def full?
    return turn_count == 9
end

#def draw?
    #if full? && won? == false
     #   true
    #else
     #   false
    #end
#end
#changing my "won" method fixed the O problem but broke draw. Redo draw.

def draw?
    return full? && !won?
end







def over?
    won? || draw?
end

def winner 
    #if won? 
    #@board[won?[0]]
    #end
    #brain lock on how to get a return when "O" wins. #codingat5am  lets try another method.
    WIN_COMBINATIONS.detect do |win_combo| 
        if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X" 
          return "X"
        elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
          return "O"
        
     end
  end
end
#this method is significantly more complicated. 
#if time allows go back and make # method work. Less code same function = good.

#def play
    #while over? == false
        #turn
    #end
    #if won?
        #puts "Congratulations #{winner}!"
    #else
        #puts "Cats's Game!"
    #end
#end
#AAAHHH The x but not O issue strikes again. Definitely ask M whats goin on. Going to do another method for now

def play
    until over?
        turn
    end
    if won?
        puts "Congratulations #{winner}!"
    else
        puts "Cat's Game!"
    end
end










end

#YES FINALLY! Go over this whole thing with M. A whole lot of stuff that I don't get in the slightest here. "NO O" problem.