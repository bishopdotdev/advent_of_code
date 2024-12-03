module AdventOfCode
  module Year2024
    class Day03
      def initialize(input)
        @input = input.strip.split("\n")
      end

      def solve
        {
          part1: solve_part1,
          part2: solve_part2
        }
      end

      private

      def solve_part1
        # Goal is to multiply some numbers
        # mul(X, Y) where X and Y are each 1-3 digit numbers
        # There are many invalid characters in the input, only consider numbers
        total = 0
        @input.each do |line|
          total += line.scan(/mul\((\d{1,3}),(\d{1,3})\)/).map { |x, y| x.to_i * y.to_i }.sum
        end

        total
      end

      def solve_part2
        # Your solution for part 2
      end
    end
  end
end
