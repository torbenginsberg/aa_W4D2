require_relative "./piece.rb"

class Knight < Piece
    include Steppable

    def symbol
        :N
    end
end