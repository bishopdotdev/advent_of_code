# frozen_string_literal: true

require 'thor'
require 'fileutils'

# CLI interface for Advent of Code solutions
module AdventOfCode
  # Command line tool to run and generate Advent of Code solutions
  class CLI < Thor
    desc 'solve YEAR DAY', 'Solve puzzle for specific year and day'
    def solve(year, day)
      day_padded = day.to_s.rjust(2, '0')

      # Dynamically require the solution file
      require_relative "years/#{year}/day_#{day_padded}"

      # Dynamically get the class (e.g., AdventOfCode::Year2023::Day01)
      klass = Object.const_get("AdventOfCode::Year#{year}::Day#{day_padded}")

      input_file = File.read("inputs/#{year}/day_#{day_padded}.txt")
      solution = klass.new(input_file).solve

      puts "Solution for Year #{year} Day #{day}:"
      puts "Part 1: #{solution[:part1]}"
      puts "Part 2: #{solution[:part2]}"
    end

    desc 'new YEAR DAY', 'Create template files for a new day'
    def new(year, day)
      day_padded = day.to_s.rjust(2, '0')

      # Create directories if they don't exist
      ["lib/years/#{year}", "spec/years/#{year}", "inputs/#{year}"].each do |dir|
        Dir.mkdir(dir) unless Dir.exist?(dir)
      end

      # Create solution file
      create_solution_file(year, day_padded)

      # Create spec file
      create_spec_file(year, day_padded)

      # Create empty input file
      File.write("inputs/#{year}/day_#{day_padded}.txt", '')

      puts "Created template files for Year #{year} Day #{day}"
    end

    desc 'reset', 'Delete all year attempts and specs (with confirmation)'
    def reset
      puts '⚠️  WARNING: This will delete all year attempts, specs, and inputs.'
      puts 'This action cannot be undone!'
      print 'Are you sure you want to continue? (y/N): '

      confirmation = STDIN.gets.chomp.downcase

      if confirmation == 'y'
        dirs_to_remove = ['lib/years', 'spec/years', 'inputs']

        dirs_to_remove.each do |dir|
          if Dir.exist?(dir)
            FileUtils.rm_rf(dir)
            puts "Removed #{dir}"
          end
        end

        puts 'Reset complete. All solutions have been removed.'
      else
        puts 'Reset cancelled.'
      end
    end

    private

    def create_solution_file(year, day)
      template = <<~RUBY
        module AdventOfCode
          module Year#{year}
            class Day#{day}
              def initialize(input)
                @input = input.strip.split("\\n")
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
              end

              def solve_part2
                # Your solution for part 2
              end
            end
          end
        end
      RUBY

      File.write("lib/years/#{year}/day_#{day}.rb", template)
    end

    def create_spec_file(year, day)
      template = <<~RUBY
        require_relative "../../../lib/years/#{year}/day_#{day}"

        RSpec.describe AdventOfCode::Year#{year}::Day#{day} do
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
      RUBY

      File.write("spec/years/#{year}/day_#{day}_spec.rb", template)
    end
  end
end
