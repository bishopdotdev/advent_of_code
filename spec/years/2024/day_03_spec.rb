require_relative '../../../lib/years/2024/day_03'

RSpec.describe AdventOfCode::Year2024::Day03 do
  let(:example_input) do
    <<~INPUT
      xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))
    INPUT
  end
  let(:part2_input) do
    <<~INPUT
      xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))
    INPUT
  end

  describe '#solve_part1' do
    it 'solves the example' do
      solution = described_class.new(example_input).solve
      expect(solution[:part1]).to eq(161) # Update with expected answer
    end
  end

  describe '#solve_part2' do
    it 'solves the example' do
      solution = described_class.new(part2_input).solve
      expect(solution[:part2]).to eq(48) # Update with expected answer
    end
  end
end
