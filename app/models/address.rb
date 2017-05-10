class Address < ApplicationRecord
  extend EnumerateIt

  has_enumeration_for :street_type

  def full_address
    address = "#{street_type_humanize} #{name}, nº #{number}"
    address << " - #{complement}"   if complement
    address << " - #{neighborhood}" if neighborhood
  end
end
