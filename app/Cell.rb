# Class cell with properties and methods
class Cell
    attr_reader  :neighbours
    def initialize(state = rand(100) > 70 ? 1 : 0, neighbours = 0 )
      @state = state
      @neighbours = neighbours
    end
  
    def alive?
      @state 
    end
  
    def neighbours_count(row, col, matrix)
      last_row = matrix.row_size
      last_column = matrix.column_count
    (row-1..row+1).each do |r|
              (col-1..col+1).each do |c|
                  next if r < 0 or r >= last_row
                  next if c < 0 or c >= last_column
                  next if r == row and c == col
                  @neighbours += matrix[r,c].alive?
              end
          end
          @neighbours
    end
  
    def update_state
      if @neighbours < 2 || @neighbours > 3
        @state = 0
      elsif @neighbours == 3
        @state = 1
      end
    end
  end