require "exercise_4"

describe EmailClient do
  subject { described_class.new(message_class) }
  let(:message_class) { double(:message_class, new: message) }
  let(:message) { double(:message) }

  describe "#message" do
    it "calls new on the message_class" do
      expect(message_class).to receive(:new)

      subject.message
    end

    it "returns a new message" do
      expect(subject.message).to eq message
    end
  end
end


describe SayHelloToMyLittleFriend do
  subject { described_class.new(email_client_class) }

  let(:email_client_class) { double(:email_client_class, new: email_client) }
  let(:email_client) { double(:email_client, message: message) }
  let(:message) { double(:message) }

  describe "#run" do
    it "calls new on the email client class" do
      allow(message).to receive(:send)

      expect(email_client_class).to receive(:new)

      subject.run
    end

    it "calls send on the message" do
      expect(message).to receive(:send).with('friend@example.com', "HELLO!")

      subject.run
    end
  end
end

describe Message do

  it { is_expected.to respond_to(:send).with(2).arguments }

end
