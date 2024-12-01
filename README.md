# advent_of_code

## Installation

```sh
gem install bundler
bundle install
```

## Usage

```sh
./aoc new 2024 1 # Create template files for a new day
./aoc solve 2024 1 # Solve puzzle for specific year and day
rspec # Run All tests
rspec spec/years/2024 # Run tests for a specific year
rspec spec/years/2024/day_01_spec.rb # Run tests for a specific day
```

## Editor

[Rubocop](https://github.com/rubocop/rubocop)
[Ruby Extensions Pack](https://marketplace.visualstudio.com/items?itemName=Shopify.ruby-extensions-pack)

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

