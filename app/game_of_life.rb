# frozen_string_literal: true
require_relative 'grid'
require 'matrix'

puts "Por favor, escribe el numero de Rows"
rows = gets.chomp
puts "Por favor, escribe el numero de Columnas"
columns = gets.chomp
@generation_num = 0
@grid = Grid.new(rows.to_i, columns.to_i)



def loop
    
    puts "Generation: #{@generation_num += 1}"
  
    @grid.view_matrix
    @grid.analize_cells
    @grid.new_generation
    if gets.chomp.empty? 
      loop
    else
      puts "Generation: #{@generation_num += 1}" 
      @grid.view_matrix
    end
  end

  loop