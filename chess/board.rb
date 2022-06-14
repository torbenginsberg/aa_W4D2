require_relative "./all_pieces.rb"

class Board
    def initialize
        @board = Array.new(8) { Array.new(8) }
        #  @null_piece = NullPiece initialize whole board with
    end

    attr_reader :board #,null_piece

    def [](pos)
        row, col = pos
        board[row][col]
    end

    def []=(pos, value)
        row, col = pos
        board[row][col] = value
    end

    def valid_position?(pos)
        row, col = pos
        return false if row < 0 || row > 7 || col < 0 || col > 7
        #come back later
    end

    def add_piece(piece, pos)
        self[pos] = piece
    end

    def dup
        dupe = []
        board.each do |subarr|
            new_row = []
            subarr.each { |ele| new_row << ele}
            dupe << new_row
        end
        dupe
    end

    def move_piece(start_pos, end_pos)
        # raise "No piece at position" if self[start_pos] == null_piece
        if !valid_position?(end_pos) #add more to it later
            raise "Invalid move"
        end
        piece = self[start_pos]
        self[start_pos] = #null_piece
        self[end_pos] = piece
        piece.pos = end_pos #test later
    end

end

b = Board.new
a = Bishop.new(:W, b, [0,0])
p a.moves