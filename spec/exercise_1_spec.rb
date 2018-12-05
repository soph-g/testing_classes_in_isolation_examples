require 'exercise_1'

describe Note do
  subject(:note) { described_class.new("The Title", "This is the body", note_formatter)}
  let(:note_formatter) { double(:note_formatter) }

  it "has a given title" do
    expect(note.title).to eq "The Title"
  end

  it "has a given body" do
    expect(note.body).to eq "This is the body"
  end

  it "returns a formatted note" do
    allow(note_formatter).to receive(:format).and_return "Title: The Title\nThis is the body"
    expect(note.display).to eq "Title: The Title\nThis is the body"
  end
end

describe NoteFormatter do
  subject(:note_formatter) { described_class.new }
  let(:note) { double(:note, title: "The Title", body: "This is the body") }
  it "formats a passed in note" do
    expect(note_formatter.format(note)).to eq "Title: The Title\nThis is the body"
  end
end
