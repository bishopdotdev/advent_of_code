module AdventOfCode
  module Year2024
    class Day01
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
        # Your solution for part 1
        @input.each do |line|
          puts line
        end
        11
      end

      def solve_part2
        # Your solution for part 2
      end
    end
  end
end
