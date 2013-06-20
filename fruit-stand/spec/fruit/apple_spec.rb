require 'spec_helper'

describe Fruit::Apple do

  # let(:subject) { Fruit::Apple.new }
  # let(:subject) { described_class.new }
  # let(:apple) { described_class.new }

  describe "#initialize" do
    context "when given no parameters" do
      it "variety is 'Granny Smith'" do
        expect(subject.variety).to eq "Granny Smith"
      end
    end

    context "when given a variety parameter" do
      it "variety is the specified variety" do
        apple = described_class.new "Pink Lady"
        expect(apple.variety).to eq "Pink Lady"
      end
    end
  end

  it_behaves_like "a sliceable fruit"


end