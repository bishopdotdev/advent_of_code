# frozen_string_literal: true

require_relative '../../../lib/years/2024/day_01'

RSpec.describe AdventOfCode::Year2024::Day01 do
  let(:example_input) do
    <<~INPUT
      3   4
      4   3
      2   5
      1   3
      3   9
      3   3
    INPUT
  end

  describe '#solve_part1' do
    it 'solves the example' do
      solution = described_class.new(example_input).solve
      expect(solution[:part1]).to eq(11) # Update with expected answer
    end
  end

  describe '#solve_part2' do
    it 'solves the example' do
      solution = described_class.new(example_input).solve
      expect(solution[:part2]).to eq(nil) # Update with expected answer
    end
  end
end
