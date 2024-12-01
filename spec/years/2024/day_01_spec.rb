require_relative "../../../lib/years/2024/day_01"

RSpec.describe AdventOfCode::Year2024::Day01 do
  let(:example_input) do
    <<~INPUT
      # Put your example input here
    INPUT
  end

  describe "#solve_part1" do
    it "solves the example" do
      solution = described_class.new(example_input).solve
      expect(solution[:part1]).to eq(nil) # Update with expected answer
    end
  end

  describe "#solve_part2" do
    it "solves the example" do
      solution = described_class.new(example_input).solve
      expect(solution[:part2]).to eq(nil) # Update with expected answer
    end
  end
end
