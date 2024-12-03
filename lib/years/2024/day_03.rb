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
        # Goal is to multiply some numbers
        # If they find do() then the next mul() is part of the next number
        # If they find don't() then the next mul() is not part of the next number
        # total = 0
        # @input.each do |line|
        #   total += line.scan(/mul\((\d{1,3}),(\d{1,3})\)/).map { |x, y| x.to_i * y.to_i }.sum
        # end
        # do(mul(1, 2)) => 0
        # don't(mul(1, 2)) => 0
        # Too high: 69247082 69247082
        # Too Low: 59700004
        all_lines = @input.join
        total = 0

        all_lines.split("don't()").each_with_index do |part, index|
          # Get all mul() up until the next don't()
          # don't() negates the next mul()
          if index.zero?
            total += part.scan(/mul\((\d{1,3}),(\d{1,3})\)/).map { |x, y| x.to_i * y.to_i }.sum
          else
            part.split('do()').each_with_index do |sub_part, sub_index|
              next if sub_index.zero?

              total += sub_part.scan(/mul\((\d{1,3}),(\d{1,3})\)/).map { |x, y| x.to_i * y.to_i }.sum
            end
          end
        end

        total
      end
    end
  end
end
