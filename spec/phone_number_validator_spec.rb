require "spec_helper"

RSpec.describe TaiwanValidator::PhoneNumberValidator do
  subject { TaiwanValidator::PhoneNumberValidator }

  describe ".valid?" do
    it "accepts +886 as start digits" do
      expect(subject.valid?("+886912123123")).to be_truthy
    end

    it "accepts 886 as start digits" do
      expect(subject.valid?("886912123123")).to be_truthy
    end

    it "accepts 0 as start digits" do
      expect(subject.valid?("0912123123")).to be_truthy
    end

    it "doesn't accepts without 886|0 as start digits" do
      expect(subject.valid?("912123123")).to be_falsey
    end

    it "accepts 2-9 as local distric or mobile digits" do
      expect(subject.valid?("0212123123")).to be_truthy
    end

    it "doesn't accepts 1 as local distric or mobile digits" do
      expect(subject.valid?("0112123123")).to be_falsey
    end

    it "accepts 6 digits long as number digits" do
      expect(subject.valid?("02123456")).to be_truthy
    end

    it "accepts 8 digits long as number digits" do
      expect(subject.valid?("0212345678")).to be_truthy
    end
  end
end
