class RealStateAgency < ApplicationRecord
  extend EnumerateIt

  before_create :only_one_row

  mount_uploader :avatar, AvatarUploader

  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address

  private

  def only_one_row
    false if RealStateAgency.count > 0
  end

end
