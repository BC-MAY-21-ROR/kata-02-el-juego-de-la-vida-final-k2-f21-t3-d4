# frozen_string_literal: true

require 'matrix'

class Grid
    attr_accessor :m
  def initialize(rows, cols)
    @rows = rows
    @cols = cols
    @m = Matrix.build(@rows, @cols) { Cell.new }
    
  end

  def view_matrix
    @rows.times do |rows|
      @cols.times do |cols|
        print @m[rows, cols].alive? == 1 ? '*' : '.'
        end  
      puts ''
        end 
    end

    def analize_cells 
        @rows.times do |rows|
            @cols.times do |cols|
               @m[rows, cols].neighbours_count(rows, cols, @m)
            end  
          
        end 
    end
          
    def new_generation
        @rows.times do |rows|
            @cols.times do |cols|
               @m[rows, cols].update_state
            end  
        end 
    end

    
end

class Cell
    
  def initialize
    @state = rand(100) > 70 ? 1 : 0 
    @neighbours = 0
  end

  def alive?
    @state 
  end

  def neighbours_count(row, col, matrix)
    last_row = matrix.row_size-1
    last_column = matrix.column_count-1
    
    @neighbours += matrix[row - 1, col - 1].alive?() unless row == 0 || col == 0
    @neighbours += matrix[row + 1, col + 1].alive?() unless row == last_row || col ==last_column
    @neighbours += matrix[row - 1, col].alive?()  unless row == 0
    @neighbours += matrix[row - 1, col + 1].alive?() unless row == 0 || col == last_column
    @neighbours += matrix[row + 1,col - 1].alive?() unless row == last_row || col == 0
    @neighbours += matrix[row + 1, col].alive?() unless row == last_row
    @neighbours += matrix[row, col + 1].alive?() unless col == last_column
    @neighbours += matrix[row, col - 1].alive?() unless col == 0

    return @neighbours
  end

  def update_state
    if @neighbours < 2 || @neighbours > 3
      @state = 0
    elsif @neighbours == 3
      @state = 1
    end
  end
end

grid = Grid.new(3, 3)
grid.view_matrix
grid.analize_cells
grid.new_generation
puts "Generacion 2"
grid.view_matrix