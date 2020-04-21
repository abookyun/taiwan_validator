class TaiwanValidator::UbnValidator < ActiveModel::EachValidator
  MULTIPLIER = [1,2,1,2,1,2,4,1].freeze

  class << self
    def valid?(ubn)
      ubn = ubn.to_s
      return false if ubn.size != 8 || (ubn =~ /\A\d+\Z/).nil?

      digits = ubn.chars.map(&:to_i)
      results = digits.zip(MULTIPLIER).map do |op1, op2|
        digit = op1 * op2
        digit = digit.to_s.chars.map(&:to_i).reduce(&:+) if number_digits(digit) == 2
        digit
      end.inject(&:+)

      results % 10 == 0 || (ubn[6] == "7" && (results + 1) % 10 == 0)
    end

    private

    def number_digits(number)
      number.zero? ? 1 : Math.log10(number).to_i + 1
    end
  end

  def validate_each(record, attribute, value)
    unless self.class.valid?(value)
      record.errors.add(attribute, options[:message] || :invalid)
    end
  end
end
