# frozen_string_literal: true
require_relative 'Cell'
require 'matrix'
# Class Grid of cells
class Grid
    attr_reader :matrix
    def initialize(rows, cols, matrix = Matrix.build(rows, cols) { Cell.new })
      @rows = rows
      @cols = cols
      @matrix = matrix
      
    end
  
    def view_matrix
      @rows.times do |rows|
        @cols.times do |cols|
          print @matrix[rows, cols].alive? == 1 ? '*' : '.'
          end  
        puts ''
          end 
      end
  
      def analize_cells 
          @rows.times do |rows|
              @cols.times do |cols|
                 @matrix[rows, cols].neighbours_count(rows, cols, @matrix)
              end  
            
          end 
      end
            
      def new_generation
          @rows.times do |rows|
              @cols.times do |cols|
                 @matrix[rows, cols].update_state
              end  
          end 
      end  
  end