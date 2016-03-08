
class Game

	def initialize
		@board = Array.new(9)
		@players = [HumanPlayer.new("player_1", "x", self), CompPlayer.new("player_2", "o", self)]
		@current_player_id = 0
	end

	attr_accessor :board, :current_player

	def other_player_id
		1 - @current_player_id
	end
	def otherPlayer
		@players[other_player_id]
	end
	def currentPlayer
		@players[@current_player_id]
	end
	def switchPlayer!
		@current_player_id = other_player_id
	end
	
	def setMove(player)
		move = player.selection
		@board[move] = player.marker
	end
	
	def fullBoard?
		@board.any?{|x| x.nil?} == false
	end
	def available
		self.select{|x| x.nil?}
	end

	def play
		while @board.any?{|x|x.nil?} do
				displayBoard
				setMove(currentPlayer)
				if winner?
					p "Congratulations! #{currentPlayer.name} wins!"
					displayBoard
					return
				end
				
				switchPlayer!
		end 
	end

	def winner?
		if horizontalWin? || verticalWin? || leftOriginDiagonalWin? || rightOriginDiagonalWin?
			true
		end
	end
	def horizontalWin?
		case 
			when @board[0] == @board[1] && @board[0] == @board[2] && @board[0] == currentPlayer.marker
				true
			when @board[3] == @board[4] && @board[3] == @board[5] && @board[3] == currentPlayer.marker
				true
			when @board[6] == @board[7] && @board[6] == @board[8] && @board[6] == currentPlayer.marker
				true
			else
				false
		end
	end
	def verticalWin?
		case 
			when @board[0] == @board[3] && @board[0] == @board[6] && @board[0] == currentPlayer.marker
		    	true
		    when @board[1] == @board[4] && @board[1] == @board[7] && @board[1] == currentPlayer.marker
		    	true
		    when @board[2] == @board[5] && @board[2] == @board[8] && @board[2] == currentPlayer.marker
		    	true
			else
				false
		end	
	end
	
	def leftOriginDiagonalWin?
		if @board[0] == @board[4] && @board[0] == @board[8] && @board[0] = currentPlayer.marker
			true
		end
	end
	def rightOriginDiagonalWin?
		if @board[2] == @board[4] && @board[2] == @board[6] && @board[2] == currentPlayer.marker
			true
		end
	end

	def displayBoard
		puts " #{board[0]} | #{board[1]} | #{board[2]}"
		puts "--+--+--"
		puts " #{board[3]} | #{board[4]} | #{board[5]}"
		puts "--+--+--"
		puts " #{board[6]} | #{board[7]} | #{board[8]}"
	end
	def displayCell(cell)
		if @board[cell].nil?
			puts " "
		else
			puts "#{@board[cell]}"
		end
	end
end

class Player
	def initialize(name, marker, game)
		@name = name
		@marker = marker
		@game = game
	end

	attr_accessor :name, :marker
end


class HumanPlayer < Player
	def selection
		puts "Choose number 0 - 8: "
			choice = gets.chomp.to_i
		until @game.board[choice].nil?
			puts "That position is already taken! Try again."
			choice = gets.chomp.to_i
		end
		return choice
	end
end

class CompPlayer < Player

	def selection
		p "Waiting for computer's choice..."
		sleep(2)
		choice = 4
		until @game.board[choice].nil?
			choice = rand(9)
		end
		return choice 
	end
end

gigo = Game.new
gigo.play


	

