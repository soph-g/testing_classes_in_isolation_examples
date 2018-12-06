require 'exercise_1'

describe Note do
  subject(:note) { described_class.new("The Title", "The body", formatter_double) }

  let(:formatter_double) { double(:note_formatter) }

  it "has a given title" do
    expect(note.title).to eq "The Title"
  end

  it "has a given body" do
    expect(note.body).to eq "The body"
  end

  describe "#display" do
    it "returns a formatted note" do
      allow(formatter_double).to receive(:format).and_return "Title: The Title\nThe body"

      expect(note.display).to eq "Title: The Title\nThe body"
    end
  end
end

describe NoteFormatter do
  subject(:note_formatter) { described_class.new }

  let(:note_double) { double(:note, title: "The Title", body: "The body") }

  it "formats a passed in note" do
    expect(note_formatter.format(note_double)).to eq "Title: The Title\nThe body"
  end
end
