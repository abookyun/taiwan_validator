class PhoneNumberValidator < ActiveModel::EachValidator
  class << self
    def valid?(phone_number)
      phone_number.gsub(/[\+\-\s]/, "") =~ /\A(886|0)[2-9]([0-9]{6,8})\z/
    end
  end

  def validate_each(record, attribute, value)
    unless self.class.valid?(value)
      record.errors.add(attribute, options[:message] || :invalid)
    end
  end
end
