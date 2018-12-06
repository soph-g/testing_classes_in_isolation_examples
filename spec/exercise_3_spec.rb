require 'exercise_3'

describe Diary do
  subject {described_class.new(entry_class) }
  let(:entry_class) { double(:entry_class, new: entry) }
  let(:entry) { double(:entry) }

  describe "#add" do
    it "adds a new entry" do
      notes = subject.add("Note 1 Title", "Note 1 body")

      allow(entry).to receive(:title).and_return("Note 1 Title")
      allow(entry).to receive(:body).and_return("Note 1 body")

      expect(notes[0].title).to eq "Note 1 Title"
      expect(notes[0].body).to eq "Note 1 body"
    end
  end


  describe "#index" do
    it "gives a list of titles" do
      subject.add("Note 1 Title", "Note 1 body")
      subject.add("Note 2 Title", "Note 2 body")
      subject.add("Note 3 Title", "Note 3 body")

      # This example configures the entry double to return a different value each time `title` is called. Find out more here: https://relishapp.com/rspec/rspec-mocks/v/3-8/docs/configuring-responses/returning-a-value#specify-different-return-values-for-multiple-calls

      allow(entry).to receive(:title).and_return("Note 1 Title", "Note 2 Title", "Note 3 Title")

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
