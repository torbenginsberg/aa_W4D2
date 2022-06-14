require "byebug"
module Slideable

   HORIZONTAL_DIRS = [[0, 1], [0, -1], [-1, 0], [1, 0]]
   DIAGONAL_DIRS = [[-1, 1], [-1, -1], [1, 1], [1, -1]]

    def moves
        arr = []
        move_dirs.each do |dirs|
            if dirs == :horizontal
                arr.concat(horizontal_dirs)
            elsif dirs == :diagonal
                arr.concat(diagonal_dirs)
            end
        end
        arr
    end

    def move_dirs
        [:horizontal, :diagonal]
    end

    def horizontal_dirs
        self.grow_unblocked_moves_in_dir(HORIZONTAL_DIRS)
    end

    def diagonal_dirs
        self.grow_unblocked_moves_in_dir (DIAGONAL_DIRS)
    end

    def in_board?(pos)
        row, col = pos
        return false if row < 0 || row > 7 || col < 0 || col > 7
        true
    end

    def grow_unblocked_moves_in_dir(constant)
        arr = []
        constant.each do |pos|
            temp = []
            next_pos = [self.pos[0] + pos[0], self.pos[1] + pos[1]]
            while in_board?(next_pos)
                temp << next_pos
                next_pos = [next_pos[0] + pos[0], next_pos[1] + pos[1]]
            end
            arr.concat(temp)
        end
        arr
    end

end

