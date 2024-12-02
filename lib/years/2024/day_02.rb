module AdventOfCode
  module Year2024
    class Day02
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
        total = 0
        @input.each do |line|
          list_of_numbers = line.split.map(&:to_i)
          previous_number = list_of_numbers[0]
          state = :increasing
          safe = true

          list_of_numbers.each_with_index do |number, index|
            if index.zero?
              previous_number = number
              next
            end

            # Set order state
            if index == 1
              if number > previous_number
                state = :increasing
              elsif number < previous_number
                state = :decreasing
              end
            end

            # Check if number is in the wrong order
            if state == :increasing && (number <= previous_number || number - previous_number > 3)
              safe = false
            elsif state == :decreasing && (number >= previous_number || number - previous_number < -3)
              safe = false
            end

            previous_number = number
          end

          total += 1 if safe
        end
        total
      end

      def solve_part2
        # Your solution for part 2
      end
    end
  end
end
