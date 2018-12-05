require 'exercise_1'

describe Note do
  subject(:note) { described_class.new("The Title", "This is the body")}

  it "has a given title" do
    expect(subject.title).to eq "The Title"
  end

  it "has a given body" do
    expect(subject.body).to eq "This is the body"
  end

  it "returns a formatted note" do
    expect(subject.display).to eq "Title: The Title\nThis is the body"
  end
end

describe NoteFormatter do
  subject(:note_formatter) { described_class.new }
  let(:note) { Note.new("The Title", "This is the body") }
  it "formats a passed in note" do
    expect(note_formatter.format(note)).to eq "Title: The Title\nThis is the body"
  end
end
