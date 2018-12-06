require 'exercise_2'

describe Greeter do

  subject { described_class.new(kernel) }
  let(:kernel) { double(:kernel, gets: "Sophie") }

  it "asks for the users name" do
    expect(kernel).to receive(:puts).with("What is your name?")
    expect(kernel).to receive(:gets)

    allow(kernel).to receive(:puts).with("Hello, Sophie")

    subject.greet
  end

  it "greets the user" do
    allow(kernel).to receive(:puts).with("What is your name?")

    expect(kernel).to receive(:puts).with("Hello, Sophie")

    subject.greet
  end
end
