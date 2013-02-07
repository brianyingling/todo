require_relative '../note'
require_relative 'spec_helper'


describe Note do
  let(:note) {Note.new('Get Groceries','Get some groceries.')}

  describe "#initialize" do
    it "instantiates a Note object" do
      expect(note).to_not eq nil
    end
  end

  describe "#title" do
    it "has a title method" do
      expect(note.title).to_not eq nil
    end
  end

  describe "#description" do
    it "has a description" do
      expect(note.description).to_not eq nil
    end
  end

  describe ".connect" do
    it "connects to the database" do
      expect(note.connect).to be_a_kind_of(Connection)
    end
  end

  describe "#insert" do
    it "has an insert method" do
      expect(note.insert).to_not eq nil
    end
  end

end
