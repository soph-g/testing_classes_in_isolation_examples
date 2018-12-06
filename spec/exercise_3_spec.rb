require 'exercise_3'

describe Diary do
  subject(:diary) {described_class.new(entry_class_double) }
  let(:entry_class_double) { double(:entry_class, new: entry_double) }
  let(:entry_double) { double(:entry) }

  describe "#add" do
    it "adds a new entry" do
      entries = diary.add("Entry 1 Title", "Entry 1 body")

      allow(entry_double).to receive(:title).and_return("Entry 1 Title")
      allow(entry_double).to receive(:body).and_return("Entry 1 body")

      expect(entries[0].title).to eq "Entry 1 Title"
      expect(entries[0].body).to eq "Entry 1 body"
    end
  end


  describe "#index" do
    it "gives a list of titles" do
      diary.add("Entry 1 Title", "Entry 1 body")
      diary.add("Entry 2 Title", "Entry 2 body")
      diary.add("Entry 3 Title", "Entry 3 body")

      # This example configures the entry_double to return a different value each time entry_double.title is called. Find out more here: https://relishapp.com/rspec/rspec-mocks/v/3-8/docs/configuring-responses/returning-a-value#specify-different-return-values-for-multiple-calls

      allow(entry_double).to receive(:title).and_return("Entry 1 Title", "Entry 2 Title", "Entry 3 Title")

      expect(diary.index).to eq "Entry 1 Title\nEntry 2 Title\nEntry 3 Title"
    end
  end
end

describe Entry do
  subject(:entry) { described_class.new("The Title", "This is the body") }

  it "has a given title" do
    expect(entry.title).to eq "The Title"
  end

  it "has a given body" do
    expect(entry.body).to eq "This is the body"
  end
end
