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
        left_column = []
        right_column = []
        total = 0
        @input.each do |line|
          left_column << line.split[0].to_i
          right_column << line.split[1].to_i
        end

        left_column.sort!
        right_column.sort!

        left_column.size.times do |index|
          right = right_column[index]
          left = left_column[index]

          if left < right
            total += right - left
          elsif left > right
            total += left - right
          end
        end
        total
      end

      def solve_part2
        left_column = []
        right_column = []
        total = 0
        @input.each do |line|
          left_column << line.split[0].to_i
          right_column << line.split[1].to_i
        end

        left_column.each do |left|
          counts = right_column.count(left)
          total += counts * left
        end
        total
      end
    end
  end
end
