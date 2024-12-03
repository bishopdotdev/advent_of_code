# advent_of_code

## Install Ruby

```sh
brew install rbenv
rbenv install 3.3.2
```

## Install Bundler and Dependencies

```sh
gem install bundler
bundle install
```

## Reset Function

If you would like to use this repo as a template and build your own Advent of Code solutions you can run a reset function! 🎉 This will delete all my attempts and data but keeping the CLI in tact to build your own solutions.

```sh
bin/aoc reset
```

## CLI Usage

```sh
bin/aoc new 2024 1 # Create template files for a new day
bin/aoc solve 2024 1 # Solve puzzle for specific year and day
rspec # Run All tests
rspec spec/years/2024 # Run tests for a specific year
rspec spec/years/2024/day_01_spec.rb # Run tests for a specific day
```

## Test Setup

- Start at `spec/years/20xx/day_xx_spec.rb` and add your test cases

```ruby
# find this block and add your example input here
let(:example_input) do
  <<~INPUT
      # Put your example input here
    INPUT
  end

  # find this line and update nil with your expected answer
  expect(solution[:part1]).to eq(nil) # Update with expected answer
```

- Add your day's input file in `inputs/20xx/day_xx.txt`
- Work on your solution in `lib/years/20xx/day_xx.rb`
- Test your solution by running `rspec spec/years/20xx/day_xx_spec.rb`
- Run `bin/aoc solve 20xx xx` to see your results

## Editor Setup

- Install [Rubocop](https://github.com/rubocop/rubocop) VS Code Extension
- Install [Ruby Extensions Pack](https://marketplace.visualstudio.com/items?itemName=Shopify.ruby-extensions-pack) VS Code Extension

Make sure to update your vscode settings with the following:

```json
"[ruby]": {
  "editor.defaultFormatter": "Shopify.ruby-lsp", // Use the Ruby LSP as the default formatter
      "editor.formatOnSave": true, // Format files automatically when saving
      "editor.tabSize": 2, // Use 2 spaces for indentation
      "editor.insertSpaces": true, // Use spaces and not tabs for indentation
      "editor.semanticHighlighting.enabled": true, // Enable semantic highlighting
      "editor.formatOnType": true, // Enable formatting while typing
  },
```
