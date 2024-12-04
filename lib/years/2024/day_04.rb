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
        grid = @input.map(&:chars)
        count_xmas_patterns(grid)
      end

      def count_xmas_patterns(grid)
        rows = grid.length
        cols = grid[0].length
        count = 0

        # Iterate over the grid, looking for the center of the X (the "A")
        (1...rows - 1).each do |i|
          (1...cols - 1).each do |j|
            next unless grid[i][j] == 'A'

            # Define just the unique diagonal combinations that form an X
            # Each array represents [first_diagonal_positions, second_diagonal_positions]
            patterns = [
              [[[-1, -1, 'M'], [1, 1, 'S']], [[-1, 1, 'M'], [1, -1, 'S']]], # M-A-S and M-A-S
              [[[-1, -1, 'M'], [1, 1, 'S']], [[-1, 1, 'S'], [1, -1, 'M']]], # M-A-S and S-A-M
              [[[-1, -1, 'S'], [1, 1, 'M']], [[-1, 1, 'M'], [1, -1, 'S']]], # S-A-M and M-A-S
              [[[-1, -1, 'S'], [1, 1, 'M']], [[-1, 1, 'S'], [1, -1, 'M']]]  # S-A-M and S-A-M
            ]

            patterns.each do |first_diag, second_diag|
              if valid_diagonal?(grid, i, j, *first_diag) &&
                 valid_diagonal?(grid, i, j, *second_diag)
                count += 1
              end
            end
          end
        end

        count
      end

      def valid_diagonal?(grid, i, j, m_pos, s_pos)
        m_i, m_j, m_char = m_pos
        s_i, s_j, s_char = s_pos

        grid[i + m_i][j + m_j] == m_char &&
          grid[i + s_i][j + s_j] == s_char
      end
    end
  end
end
