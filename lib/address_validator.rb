class AddressValidator < ActiveModel::EachValidator
  class << self
    def valid?(zipcode = nil, city = nil, district = nil, address)
    end
  end
end
