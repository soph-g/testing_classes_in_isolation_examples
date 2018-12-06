require 'exercise_2'

describe Greeter do

  subject(:greeter) { described_class.new(kernel_double) }
  let(:kernel_double) { double(:kernel) }

  describe "#greet" do
    it "asks for the users name" do
      expect(kernel_double).to receive(:puts).with("What is your name?")
      expect(kernel_double).to receive(:gets).and_return("Marley")


      allow(kernel_double).to receive(:puts)

      greeter.greet
    end

    it "greets the user" do
      allow(kernel_double).to receive(:puts).with("What is your name?")
      allow(kernel_double).to receive(:gets).and_return("Marley")

      expect(kernel_double).to receive(:puts).with("Hello, Marley")

      greeter.greet
    end
  end
end
