class TaiwanValidator::AddressValidator < ActiveModel::EachValidator
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
