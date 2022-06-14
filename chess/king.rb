require_relative "./piece.rb"

class King < Piece
    include Steppable

    def symbol
        :K
    end
end