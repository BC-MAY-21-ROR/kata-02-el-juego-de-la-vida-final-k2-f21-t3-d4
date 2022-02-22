require 'rspec'
require 'matrix'
require_relative '../app/Cell.rb'
require_relative '../app/Grid.rb'
dead_cell=Cell.new(0)
matrix=Grid.new(2,2,Matrix[[dead_cell,Cell.new(1)],[Cell.new(1),Cell.new(1)]])
matrix.analize_cells
matrix.new_generation
describe Grid do
    it 'Create_grid creates a matrix of row times col size' do
        expect(matrix.matrix.column_count).to  eq(2)
        expect(matrix.matrix.row_count).to  eq(2)
    end
    describe '.view_matrix' do
        it 'It should print the matrix on console ' do
            
            expect { matrix.view_matrix}.to output("**\n**\n").to_stdout

        end
    end
    describe '.analize_cells'  do
        it 'It should change the number of neighbours of all the cells' do
            expect(matrix.matrix[0,0].neighbours).to eq(3)
        end
       
    end
    describe '.new_generation' do
        it 'It should change the state of the cell on the grid' do
            expect{matrix.view_matrix}.to output("**\n**\n").to_stdout
        end
    end
end

matris = Grid.new(3,3)
matrix2= matris.matrix[2,2].neighbours_count(0,0,matris.matrix)
describe Cell do
    describe '.neighbours_count' do
       it 'Count neighbors shouldn´t send more than 3 if the cell is on a corner' do
            expect(matrix2).to be <= (3)
        end
        it 'Count neighbours shouldn´t send more than 5 if the cell is on a a border' do
            matrix2=matris.matrix[2,1].neighbours_count(1,0,matris.matrix)
            expect(matrix2).to be <= (5)
        end
        it 'Count neighbors shouldnt send more than 8 if the cell is inside the grid' do
            
            expect(matris.matrix[1,1].neighbours_count(1,0,matris.matrix)).to be <= (8)
        end
    end
    describe '.update_state' do 
        it 'Should return 0 if the cell state is 1 and it has more than 3 neighbours' do
            expect(Cell.new(1,4).update_state).to eq(0)
        end
        it 'Should return 0 if the cell state is 1 and it less  than 2 neighbours' do
            expect(Cell.new(1,1).update_state).to eq(0)
        end
        it 'Should return 1 if the cell state is 0 and has exactly 3 neighbours' do
            expect(Cell.new(0,3).update_state).to eq(1)
        end
    end
    describe '.alive?' do
        it 'Should return the state of the cell' do
            expect(Cell.new())
        end
    end
end
