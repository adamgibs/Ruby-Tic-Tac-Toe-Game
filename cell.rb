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