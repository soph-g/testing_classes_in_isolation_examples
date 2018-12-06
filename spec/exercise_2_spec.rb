require 'exercise_2'

describe Greeter do
  it "greets the user" do
    allow(Kernel).to receive(:gets).and_return("Sophie")
    allow(STDOUT).to receive(:puts).with("What is your name?")
    expect(STDOUT).to receive(:puts).with("Hello, Sophie")
    subject.greet
  end
end
