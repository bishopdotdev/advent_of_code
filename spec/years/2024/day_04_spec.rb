require_relative '../../../lib/years/2024/day_04'

RSpec.describe AdventOfCode::Year2024::Day04 do
  let(:example_input) do
    <<~INPUT
      MMMSXXMASM
      MSAMXMSMSA
      AMXSXMAAMM
      MSAMASMSMX
      XMASAMXAMM
      XXAMMXXAMA
      SMSMSASXSS
      SAXAMASAAA
      MAMMMXMMMM
      MXMXAXMASX
    INPUT
  end

  let(:example_input_2) do
    <<~INPUT
      .M.S......
      ..A..MSMS.
      .M.S.MAA..
      ..A.ASMSM.
      .M.S.M....
      ..........
      S.S.S.S.S.
      .A.A.A.A..
      M.M.M.M.M.
      ..........
    INPUT
  end

  describe '#solve_part1' do
    it 'solves the example' do
      solution = described_class.new(example_input).solve
      expect(solution[:part1]).to eq(18) # Update with expected answer
    end
  end

  describe '#solve_part2' do
    it 'solves the example' do
      solution = described_class.new(example_input_2).solve
      expect(solution[:part2]).to eq(9) # Update with expected answer
    end
  end
end
