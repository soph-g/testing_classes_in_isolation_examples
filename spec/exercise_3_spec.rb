require 'exercise_3'

describe Diary do
  describe "#add" do
    it "adds a new entry" do
      notes = subject.add("Note 1 Title", "Note 1 body")
      expect(notes[0].title).to eq "Note 1 Title"
      expect(notes[0].body).to eq "Note 1 body"
    end
  end

  describe "#index" do
    it "gives a list of titles" do
      subject.add("Note 1 Title", "Note 1 body")
      subject.add("Note 2 Title", "Note 2 body")
      subject.add("Note 3 Title", "Note 3 body")
      expect(subject.index).to eq "Note 1 Title\nNote 2 Title\nNote 3 Title"
    end
  end

end

describe Entry do
  subject { described_class.new("The Title", "This is the body") }

  it "has a given title" do
    expect(subject.title).to eq "The Title"
  end

  it "has a given body" do
    expect(subject.body).to eq "This is the body"
  end
end
