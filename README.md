# Testing Classes in Isolation - Example Solutions

Example solutions to the testing classes in isolation practical.

Find the practical exercise here: https://github.com/makersacademy/skills-workshops/blob/master/practicals/object_oriented_design/dependency_injection.md

## Setup

Clone this directory.

Run `bundle install` in the parent directory.

To run tests:
```sh
rspec # will run all the tests
rspec ./spec/exercise_<NUMBER>_spec.rb # will run the tests for the given exercise number (replace <NUMBER> with 1, 2, 3 or 4)
```

See each of the individual exercise files for the tests and code.

## How to use

Run each of the tests individually, using `p` to get visibility when needed.

You can use `p` in the tests, e.g.

```ruby
describe "#display" do
  it "returns a formatted note" do
    p formatter_double

    allow(formatter_double).to receive(:format).and_return "Title: The Title\nThe body"

    expect(note.display).to eq "Title: The Title\nThe body"
  end
end
```

or in the code, e.g.

```ruby
class Note
  def initialize(title, body, formatter = NoteFormatter.new)
    @title = title
    @body = body
    @formatter = formatter
  end

  def display
    p @formatter
    @formatter.format(self)
  end

  attr_reader :title, :body
end
```

Feel free to change the code and tests in order to get a better understanding of:

1) How dependency injection is being used in each example to avoid hard dependencies between different classes.

2) How doubles are being used to isolate tests.
