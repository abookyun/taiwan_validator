require "spec_helper"
require "ubn_validator"

RSpec.describe UbnValidator do
  subject { UbnValidator }

  describe ".valid?" do
    it "accepts interger as well" do
      expect(subject.valid?(10458575)).to be_truthy
    end

    it "returns false when ubn size != 8" do
      expect(subject.valid?("1" * 7)).to be_falsey
    end

    it "returns false when ubn contains non-number digits" do
      expect(subject.valid?("s" * 8)).to be_falsey
    end

    it "returns true when results % 10 == 0" do
      expect(subject.valid?("0" * 8)).to be_truthy
    end

    it "returns true with correct example(a)" do
      expect(subject.valid?("04595257")).to be_truthy
    end

    it "returns true with correct example(b)" do
      expect(subject.valid?("10458575")).to be_truthy
    end
  end

  describe ".number_digits" do
    it "returns digits length for number" do
      expect(subject.send(:number_digits, 104)).to eq 3
    end

    it "returns 1 when meets 0" do
      expect(subject.send(:number_digits, 0)).to eq 1
    end
  end

  describe "#validate_each" do
    pending
  end
end
