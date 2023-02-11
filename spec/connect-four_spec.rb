require './lib/connect-four.rb'

describe Board do
	describe "Initialization" do
		it "creates a board that is a 6x7 array" do
			board = Board.new
			expect(board.board).to eql(Array.new(7){Array.new(6)})
		end
	end
	describe "Drop" do
		it "drops a piece in column X and have it land at the bottom" do
			board = Board.new
			board.drop(0, "x")
			expect(board.board[0][0]).to eql("x")
		end
		it "drops a piece in a half full column of Os, and lands it on top of them" do
			board = Board.new
			for _ in 0..3
				board.drop(0, "o")
			end
			board.drop(0,"x")
			expect(board.board[0]).to eql(['o','o','o','o','x',nil])
		end
		it "does not do anything when a 'x' is dropped into a full column" do
			board = Board.new
			for _ in 0..5
				board.drop(0, "o")
			end
			board.drop(0,"x")
			expect(board.board[0]).to eql(['o','o','o','o','o','o'])
		end
	end
	describe "Find Winner" do
		it "finds the winner in a line of 4 in a column" do
			board = Board.new
			for _ in 0..3
				board.drop(3, "o")
			end
			expect(board.find_winner).to eql('o')
		end
		it "finds the winner in a line of 4 in a row" do
			board = Board.new
			for i in 0..3
				board.drop(i, "o")
			end
			expect(board.find_winner).to eql('o')
		end
		it "finds the winner in a diagonal line of 4" do
			board = Board.new
			for i in 0..3
				for j in 0...(3-i)
					board.drop(i,"x")
				end
				board.drop(i, "o")
			end
			for column in board.board
				puts column.join(", ")
			end
			expect(board.find_winner).to eql('o')
		end
	end

end