module AdventOfCode
  module Year2024
    class Day04
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
        # As the search for the Chief continues, a small Elf who lives on the station tugs on your shirt; she'd like to know if you could help her with her word search (your puzzle input). She only has to find one word: XMAS.
        # This word search allows words to be horizontal, vertical, diagonal, written backwards, or even overlapping other words. It's a little unusual, though, as you don't merely need to find one instance of XMAS - you need to find all of them.
        grid = @input.map(&:chars)
        word = 'XMAS'
        count = 0

        directions = [
          [0, 1],   # right
          [1, 0],   # down
          [1, 1],   # down-right
          [1, -1],  # down-left
          [0, -1],  # left
          [-1, 0],  # up
          [-1, -1], # up-left
          [-1, 1]   # up-right
        ]

        grid.each_with_index do |row, i|
          row.each_with_index do |_, j|
            directions.each do |dx, dy|
              count += 1 if find_word(grid, word, i, j, dx, dy)
            end
          end
        end

        count
      end

      def find_word(grid, word, x, y, dx, dy)
        word.chars.each_with_index do |char, index|
          nx = x + (index * dx)
          ny = y + (index * dy)
          return false if nx < 0 || ny < 0 || nx >= grid.size || ny >= grid[0].size
          return false if grid[nx][ny] != char
        end
        true
      end

      def solve_part2
        # Your solution for part 2
      end
    end
  end
end
