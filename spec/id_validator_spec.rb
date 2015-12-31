require "spec_helper"

RSpec.describe TaiwanValidator::IdValidator do
  subject { TaiwanValidator::IdValidator }

  describe ".valid?" do
    it "returns false when id size != 10" do
      expect(subject.valid?("A" + "1" * 8)).to be_falsey
    end

    it "returns false when id not start with valid first letter" do
      expect(subject.valid?("1" * 10)).to be_falsey
    end

    it "returns false when id not with tailing 9 number digits" do
      expect(subject.valid?("A" * 10)).to be_falsey
    end

    it "returns true with correct example" do
      expect(subject.valid?("B120863158")).to be_truthy
    end
  end

  describe "#validate_each" do
    pending
  end
end
