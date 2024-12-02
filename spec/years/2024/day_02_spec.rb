require_relative '../../../lib/years/2024/day_02'

RSpec.describe AdventOfCode::Year2024::Day02 do
  let(:example_input) do
    <<~INPUT
      7 6 4 2 1
      1 2 7 8 9
      9 7 6 2 1
      1 3 2 4 5
      8 6 4 4 1
      1 3 6 7 9
    INPUT
  end

  describe '#solve_part1' do
    it 'solves the example' do
      solution = described_class.new(example_input).solve
      expect(solution[:part1]).to eq(2) # Update with expected answer
    end
  end

  describe '#solve_part2' do
    it 'solves the example' do
      solution = described_class.new(example_input).solve
      expect(solution[:part2]).to eq(nil) # Update with expected answer
    end
  end
end
