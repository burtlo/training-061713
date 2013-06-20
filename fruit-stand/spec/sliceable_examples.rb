shared_examples "a sliceable fruit" do

  describe "#slice" do
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
        subject.slice(4)
        expect(subject.remaining_slices).to eq 4
      end
    end

    context "when given a number of slices parameter greater than the remaining slices" do
      it "returns the all of the remaining slices" do
        subject.slice(4)
        expect(subject.slice(5)).to eq 4
      end

      it "returns the correct number of remaining slices" do
        subject.slice(4)
        subject.slice(5)
        expect(subject.remaining_slices).to eq 0
      end
    end
  end
end
