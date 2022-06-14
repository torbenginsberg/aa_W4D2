module Steppable
    MOVES = [-1, 1]

    def circle(pos)
        arr = []
        MOVES.each do |idx1|
            MOVES.each do |idx2|
                arr << [pos[0] + idx, pos[1]]
                arr << [pos[0] + idx, pos[1] + idx]
                arr << [pos[0] + idx, pos[1] + idx2]
                arr << [pos[0] - idx, pos[1] + idx2]
            end
        end
    end
    



end