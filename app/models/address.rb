class Address < ApplicationRecord
  extend EnumerateIt

  has_enumeration_for :street_type

end
