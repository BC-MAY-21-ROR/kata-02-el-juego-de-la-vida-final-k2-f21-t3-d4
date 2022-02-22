require 'rspec'
require 'matrix'
require_relative 'game_of_life.rb'
matrix = Grid.new(3,3)
testM=Matrix.build(3,3){0}
cell= Cell.new()
describe Grid do
    it 'Create_grid creates a matrix of row times col size' do
        expect(matrix.m.column_count).to  eq(testM.column_count)
        expect(matrix.m.row_count).to  eq(testM.row_count)
    end
    describe '.view_matrix' do
        it 'It should print the matrix on console ' do
            matrix = Grid.new(2,2)
            expect { matrix.view_matrix}.to output("#{matrix.m[0,0].alive? == 1?'*':'.'}#{matrix.m[0,1].alive? == 1?'*':'.'}\n#{matrix.m[1,0].alive? == 1?'*':'.'}#{matrix.m[1,1].alive? == 1?'*':'.'}\n").to_stdout

        end
    end
end

matris = Grid.new(3,3)
describe Cell do
    describe '.neighbours_count' do
        it 'Count neighbors shouldn´t send more than 3 if the cell is on a corner' do
            expect(matris.m[0,0].neighbours_count(0,0,matris.m)).to be <= (3) 
            expect(matris.m[0,2].neighbours_count(0,2,matris.m)).to be <= (3)
            expect(matris.m[2,0].neighbours_count(2,0,matris.m)).to be <= (3)
            expect(matris.m[2,2].neighbours_count(2,2,matris.m)).to be <= (3)
        end
        it 'Count neighbors shouldn´t send more than 5 if the cell is on a a border' do
            expect(matris.m[1,0].neighbours_count(1,0,matris.m)).to be <= (5)
            expect(matris.m[0,1].neighbours_count(0,1,matris.m)).to be <= (5)
            expect(matris.m[1,2].neighbours_count(1,2,matris.m)).to be <= (5)
            expect(matris.m[2,1].neighbours_count(2,1,matris.m)).to be <= 5
        end
    end
    describe '.update_state' do 
        it 'Should return the new state of the cell based on its neighbours' do
            expect(cell.update_state).to eq(0)
        end
    end
end
