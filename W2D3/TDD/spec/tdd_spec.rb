require 'tdd'

describe Array do   
  describe '#my_uniq' do
    let(:input_arr) {[1, 2, 1, 3, 3]}
    
    it 'should be an Array method' do
      expect{ input_arr.my_uniq }.not_to raise_error
    end
    
    it 'should return a new array' do
      expect(input_arr.my_uniq).not_to be(input_arr)
    end
    
    it 'should remove duplicates in the array' do
      expect(input_arr.my_uniq).to eq([1,2,3])
      expect([].my_uniq).to eq([])
    end 

  end

  describe '#two_sum' do
    let(:input_arr) {[-1, 0, 2, -2, 1]}
    
    it 'should be an Array method' do
      expect{ input_arr.two_sum }.not_to raise_error
    end
    
    it 'should return an empty array if no pairs are found' do 
      expect([1,1,1,1].two_sum).to eq([])
    end 
    
    it 'should return a nested array if there are pairs' do
      two_sum_arr = input_arr.two_sum
      
      expect(two_sum_arr).to all(be_an(Array))
    end 
    
    it 'should find pairs of indices, regardless of order' do 
      expect(input_arr.two_sum).to match_array([[0, 4], [2, 3]])
    end 
    
    it 'nested arrays should be sorted dictionary wise' do
      expect(input_arr.two_sum).to eq([[0, 4], [2, 3]])
    end  

  end
end

  describe '#my_transpose' do
    let(:input_matrix) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }
    
    it 'should take in a square matrix' do
      expect{my_transpose("string")}.to raise_error(ArgumentError)
      expect{my_transpose([[1],[2]])}.to raise_error(ArgumentError)
    end
    
    it 'should return a nested array' do
      transposed_arr = my_transpose(input_matrix)
      
      expect(transposed_arr.first).to be_an_instance_of(Array)
    end 
    
    it 'should convert between the row-oriented and column-oriented representations' do
      expect(my_transpose(input_matrix)).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end
  end

  describe '#stock_picker' do
    let(:input_arr) { [6,2,1,5,4] }
    
    it 'should raise an ArgumentError if input is not an array' do
      expect { stock_picker("string") }.to raise_error(ArgumentError)
      expect { stock_picker(1) }.to raise_error(ArgumentError)
    end
    
    it 'should obtain the most profitable pair of days to buy and sell stock' do
      expect(stock_picker(input_arr)).to eq([2,3])
    end
    
    it 'should buy on low and keep if there are no good sell days' do
      expect(stock_picker([3,2,1])).to eq([2])
    end
    
  end


describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }
  let(:start_arr) { [[3,2,1],[],[]] }
  
  describe '#initialize' do
    it 'should initialize with an array with three sub arrays' do
      expect(game.board).to eq(start_arr)
    end
  end
  
  describe '#move' do
    it 'should move the piece' do
      expect(game.move(100,0)).to eq([[3,2,1],[],[]])
      expect(game.move(0,1)).to eq([[3,2],[1],[]])
      game.move(1,2)
      expect(game.board).to eq([[3,2],[],[1]])
    end
  end
  
  describe '#won?' do
    it 'should return true if board is in win state' do
      win = game.board[0..1].any? {|el| el.length == 3}
      expect(game.won?).to eq(win)
    end 
  end
end