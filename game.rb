class Game
	def initialize(player_1, player_2)
		@board = ["","","","","","","","",""]
		@player_1 = player_1
		@player_2 = player_2
	end
	def game_on?
		self.any?{|x|x.is_empty?}
	end
	def anotherTurn
		if game_on?
			changeCell(playerMove, XorO)
		end
	end
end
