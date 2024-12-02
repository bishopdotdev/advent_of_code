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

      def run_through_list(list_of_numbers, removed_index)
        previous_number = list_of_numbers[0]
        state = nil

        list_of_numbers.each_with_index do |number, index|
          if index.zero?
            previous_number = number
            next
          end

          if index == 1
            state = if number > previous_number && previous_number < list_of_numbers[-1]
                      :increasing
                    else
                      :decreasing
                    end
          end

          # Check if number is in the wrong order
          if state == :increasing && (number <= previous_number || number - previous_number > 3)
            return false if removed_index

            if index == 1
              new_list_one = list_of_numbers.dup
              new_list_one.delete_at(index)
              new_list_two = list_of_numbers.dup
              new_list_two.delete_at(0)
              return run_through_list(new_list_one, true) || run_through_list(new_list_two, true)
            else
              new_list = list_of_numbers.dup
              new_list.delete_at(index)
              return run_through_list(new_list, true)
            end

          elsif state == :decreasing && (number >= previous_number || number - previous_number < -3)
            return false if removed_index

            if index == 1
              new_list_one = list_of_numbers.dup
              new_list_one.delete_at(index)
              new_list_two = list_of_numbers.dup
              new_list_two.delete_at(0)
              return run_through_list(new_list_one, true) || run_through_list(new_list_two, true)
            else
              new_list = list_of_numbers.dup
              new_list.delete_at(index)
              return run_through_list(new_list, true)
            end
          end
          previous_number = number
        end
        # puts 'No issues found' unless removed_index
        # puts '1 issue found' if removed_index

        true
      end

      def solve_part2
        total = 0
        @input.each do |line|
          list_of_numbers = line.split.map(&:to_i)

          result = run_through_list(list_of_numbers, false)
          total += 1 if result
        end
        total
      end
    end
  end
end
