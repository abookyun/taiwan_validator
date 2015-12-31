require "spec_helper"

RSpec.describe TaiwanValidator::AddressValidator do
  subject { TaiwanValidator::AddressValidator }

  describe ".valid?" do
    it "accepts zipcode as a start" do
      expect(subject.valid?("10048 臺北市中正區重慶南路1段122號")).to be_truthy
    end

    it "accepts zipcode as a start or not" do
      expect(subject.valid?("臺北市中正區重慶南路1段122號")).to be_truthy
    end

    it "doesn't accepts address without city" do
      expect(subject.valid?("中正區重慶南路1段122號")).to be_falsey
    end

    it "accepts address without district" do
      expect(subject.valid?("臺北市中正區重慶南路1段122號")).to be_truthy
    end
  end
end
