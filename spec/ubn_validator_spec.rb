require "spec_helper"

RSpec.describe TaiwanValidator::UbnValidator do
  subject { TaiwanValidator::UbnValidator }

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

    it "returns true with correct example(c)" do
      expect(subject.valid?("16894172")).to be_truthy
    end

    it "returns true with correct example(d)" do
      expect(subject.valid?("10458575")).to be_truthy
    end
  end

  describe "#validate_each" do
    pending
  end
end
