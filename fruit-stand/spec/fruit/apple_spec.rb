require 'spec_helper'

describe Fruit::Apple do

  # let(:subject) { Fruit::Apple.new }
  # let(:subject) { described_class.new }
  # let(:apple) { described_class.new }

  describe "#ripe?" do
    context "when less than 10 seconds old" do
      it "is not ripe" do
        expect(subject).to be_unripe
        expect(subject).not_to be_ripe
      end
    end

    context "when older than 10 seconds" do
      it "is ripe" do
        subject.stub(:age).and_return(11)
        expect(subject).to be_ripe
      end
    end
  end

  describe "#initialize" do
    context "when given no parameters" do
      it "variety is 'Granny Smith'" do
        apple = Fruit::Apple.new
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

  describe "#size" do
    it "is created with a size from the weather service" do
      Fruit::Weather.should_receive(:report).with(:apple).and_return(8)
      expect(subject.size).to eq Array.new(8)
    end
  end

  describe "#slice" do

    let(:subject) do
      apple = Fruit::Apple.new
      apple.stub(:size).and_return(Array.new(8))
      apple
    end

    context "when given no parameters" do
      it "returns removes one slice of the apple" do
        expect(subject.slice).to eq 1
      end

      it "reports the correct number of remaining slices" do
        total_remaining_slices = subject.remaining_slices
        subject.slice
        expect(subject.remaining_slices).to eq (total_remaining_slices - 1)
      end
    end

    context "when given a number of slices parameter" do
      it "returns the correct number of slices" do
        expect(subject.slice(4)).to eq 4
      end

      it "reports the correct number of remaining slices" do
        total_remaining_slices = subject.remaining_slices
        sliced_amount = subject.slice(4)
        expect(subject.remaining_slices).to eq (total_remaining_slices - sliced_amount)
      end
    end

    context "when given a number of slices parameter greater than the remaining slices" do
      it "returns the all of the remaining slices" do
        total_remaining_slices = subject.remaining_slices
        subject.slice(total_remaining_slices - 2)
        expect(subject.slice(3)).to eq 2
      end

      it "returns the correct number of remaining slices" do
        total_remaining_slices = subject.remaining_slices
        subject.slice(total_remaining_slices - 2)
        subject.slice(3)
        expect(subject.remaining_slices).to eq 0
      end
    end
  end

end