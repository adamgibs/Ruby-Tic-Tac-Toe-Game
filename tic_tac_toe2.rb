board = ["","","","","","","","",""]

class Player
	def playerTurn
		puts "Enter a number 0 - 8: "
		userAnswer = gets.chomp.to_i
	end

	def compTurn
		compMove = rand(9)
	end
end

class Cell
	def is_empty?
		self==""
	end
	def changeCell(playerMove, XorO)
		if self.is_empty?
			board[playerMove]=XorO
		else
			p "That cell is already taken!"
		end
	end

end

class Game
	def game_on?
		self.any?{|x|x.is_empty?}
	end
	def anotherTurn
		if game_on?
			changeCell(playerMove, XorO)
		end
	end
end
p is_empty?(board[1])