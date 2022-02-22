# frozen_string_literal: true
require_relative 'Grid'
require 'matrix'

puts "Por favor, escribe el numero de Rows"
rows = gets.chomp
puts "Por favor, escribe el numero de Columnas"
columns = gets.chomp
grid = Grid.new(rows.to_i, columns.to_i)
grid.view_matrix
grid.analize_cells
grid.new_generation
puts "Generacion 2"
grid.view_matrix
