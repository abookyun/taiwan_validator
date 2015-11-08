class IdValidator < ActiveModel::EachValidator
  MULTIPLIER = [1,9,8,7,6,5,4,3,2,1,1].freeze
  FIRST_LETTER = HashWithIndifferentAccess.new(
    A: 10, B: 11, C: 12, D: 13, E: 14,
    F: 15, G: 16, H: 17, I: 34, J: 18,
    K: 19, M: 21, N: 22, O: 35, P: 23,
    Q: 24, T: 27, U: 28, V: 29, W: 32,
    X: 30, Z: 33
  ).freeze
  DEPRECATED_FIRST_LETTER = HashWithIndifferentAccess.new(
    L: 20, R: 25, S: 26, Y: 31
  ).freeze
  VALID_FIRST_LETTER = FIRST_LETTER.merge(DEPRECATED_FIRST_LETTER).freeze

  class << self
    def valid?(id)
      id = id.to_s
      return false if id.size != 10 || !(VALID_FIRST_LETTER.keys.include?(id[0])) || (id[1..9] =~ /\A\d+\Z/).nil?

      digits = (VALID_FIRST_LETTER[id[0]].to_s.chars + id[1..9].to_s.chars).map(&:to_i)
      results = digits.zip(MULTIPLIER).map { |r| r.inject(&:*) }.inject(&:+)

      results % 10 == 0 ? true : false
    end
  end

  def validate_each(record, attribute, value)
    unless self.class.valid?(value)
      record.errors.add(attribute, options[:message] || :invalid)
    end
  end
end
