class Player
	def humanTurn
		puts "Enter a number 0 - 8: "
		userAnswer = gets.chomp.to_i
	end

	def compTurn
		compMove = rand(9)
	end
end