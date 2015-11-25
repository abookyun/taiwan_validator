class AddressValidator < ActiveModel::EachValidator
  # "(?<zipcode>(^\d{5}|^\d{3})?)(?<city>\D+[縣市])(?<district>\D+?(市區|鎮區|鎮市|[鄉鎮市區]))(?<others>.+)"
  class << self
    def valid?(address)
      /(\A\d{3,5})?\s?(\D+[縣市])(\D+[鄉鎮市區])?(.+)/.match(address)
    end
  end

  def validate_each(record, attribute, value)
    unless self.class.valid?(value)
      record.errors.add(attribute, options[:message] || :invalid)
    end
  end
end
