class TaiwanValidator::UbnValidator < ActiveModel::EachValidator
  MULTIPLIER = [1,2,1,2,1,2,4,1].freeze

  class << self
    def valid?(ubn)
      ubn = ubn.to_s
      return false unless ubn.match?(/\A\d{8}\z/)

      digits = ubn.chars.map(&:to_i)
      results = digits.zip(MULTIPLIER).map do |op1, op2|
        digit = op1 * op2
        next digit if digit < 10

        digit = (digit / 10) + (digit % 10)
        next digit if digit < 10

        [digit / 10, digit % 10]
      end

      known_answers = results.select{ |x| x.is_a?(Numeric) }.inject(&:+)
      possible_answers = results.reject{ |x| x.is_a?(Numeric) }.flatten

      if possible_answers.empty?
        return known_answers % 10 == 0
      end

      possible_answers.any? do |possible_answer|
        (possible_answer + known_answers) % 10 == 0
      end
    end
  end

  def validate_each(record, attribute, value)
    unless self.class.valid?(value)
      record.errors.add(attribute, options[:message] || :invalid)
    end
  end
end
