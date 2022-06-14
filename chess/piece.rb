class Piece
    def initialize(color, board, pos)
        @color = color #symbol
        @board = board #board instance
        @pos = pos
    end

    attr_reader :color
    attr_accessor :pos

    def to_s
        self.color
    end

    def empty?
        return true if self == NullPiece
        false
    end

    def valid_moves
    end

    def pos=(val)
        pos = val
    end

    def move_into_check?(end_pos)
    end
end