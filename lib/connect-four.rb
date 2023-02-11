WIDTH = 7
HEIGHT = 6

class Board
	attr_accessor :board
	def initialize
		@board = Array.new(WIDTH) {Array.new(HEIGHT)}
	end
	def drop (index, symbol)
		column = @board[index]
		column.each_with_index do |spot, i|
			if spot == nil
				column[i]  = symbol
				return true
			end
		end
		return false
	end
	def find_winner
		for i in 0...WIDTH
			for j in 0...HEIGHT
				if board[i][j]
					if j + 3 < HEIGHT and board[i][j] == board[i][j + 1] and board[i][j] == board[i][j + 2] and board[i][j] == board[i][j + 3]
						return board[i][j]
					elsif i + 3 < WIDTH and board[i][j] == board[i + 1][j] and board[i][j] == board[i + 2][j] and board[i][j] == board[i + 3][j] 
						return board[i][j]
					elsif i + 3 < WIDTH and j + 3 < HEIGHT and board[i][j] == board[i + 1][j + 1] and board[i][j] == board[i + 2][j + 2] and board[i][j] == board[i + 3][j + 3] 
						return board[i][j]
					elsif i - 3 >= 0 and j + 3 < HEIGHT and board[i][j] == board[i - 1][j + 1] and board[i][j] == board[i - 2][j + 2] and board[i][j] == board[i - 3][j + 3] 
						return board[i][j]
					end
				end
			end
		end
		return nil
	end
	def loop
		focus = "x"
		while not find_winner()
			for j in 0...HEIGHT
				for i in 0...WIDTH
					print " " * (2 - board[i][HEIGHT - 1 - j].to_s.length) + board[i][HEIGHT - 1 - j].to_s + ","
				end
				puts
			end
			index = 100
			while index >= WIDTH or index < 0 or board[index][HEIGHT - 1]
				print "Which column do you drop it in? "
				index = gets.strip.to_i
			end
			drop(index, focus)
			if focus == "x"
				focus = "o"
			else
				focus = "x"
			end
		end
		puts "winner:" + find_winner().to_s
	end
end

board = Board.new
board.loop()