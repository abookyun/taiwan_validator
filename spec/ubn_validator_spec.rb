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

    it "returns true when ubn is 04595257" do
      expect(subject.valid?("04595257")).to be_truthy
    end

    it "returns true when ubn is 16894172" do
      expect(subject.valid?("16894172")).to be_truthy
    end

    it "returns true when ubn is 04595257" do
      expect(subject.valid?("04595257")).to be_truthy
    end

    it "returns true when ubn is 54049493" do
      expect(subject.valid?("54049493")).to be_truthy
    end

    it "returns true when ubn is 55667788" do
      expect(subject.valid?("55667788")).to be_truthy
    end

    it "returns true when ubn is 10458575 and 7th digit is '7'" do
      expect(subject.valid?("10458575")).to be_truthy
    end

    it "returns true when ubn is 70664079 and 7th digit is '7'" do
      expect(subject.valid?("70664079")).to be_truthy
    end

    it "returns true when ubn is 16894172 and 7th digit is '7'" do
      expect(subject.valid?("16894172")).to be_truthy
    end

    it "returns true when ubn is 00238778 and 7th digit is '7'" do
      expect(subject.valid?("00238778")).to be_truthy
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
