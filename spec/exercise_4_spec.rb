require "exercise_4"

describe EmailClient do
  subject(:email_client) { described_class.new(message_class_double) }
  let(:message_class_double) { double(:message_class, new: message_double) }
  let(:message_double) { double(:message) }

  describe "#message" do
    it "calls new on the message_class" do
      expect(message_class_double).to receive(:new)

      email_client.message
    end

    it "returns a new message" do
      expect(email_client.message).to eq message_double
    end
  end
end


describe SayHelloToMyLittleFriend do
  subject(:say_hello) { described_class.new(email_client_class_double) }

  let(:email_client_class_double) { double(:email_client_class, new: email_client_double) }
  let(:email_client_double) { double(:email_client, message: message_double) }
  let(:message_double) { double(:message) }

  describe "#run" do
    it "calls new on the email client class" do
      allow(message_double).to receive(:send)

      expect(email_client_class_double).to receive(:new)

      say_hello.run
    end

    it "calls send on the message" do
      expect(message_double).to receive(:send).with('friend@example.com', "HELLO!")

      say_hello.run
    end
  end
end

describe Message do

  it { is_expected.to respond_to(:send).with(2).arguments }

end
