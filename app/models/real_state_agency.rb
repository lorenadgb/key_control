class RealStateAgency < ApplicationRecord
  extend EnumerateIt

  before_create :only_one_row

  validates :trade_name, :cnpj, presence: true, on: :update

  mount_uploader :avatar, AvatarUploader

  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address
  has_one :setting, dependent: :destroy
  accepts_nested_attributes_for :setting

  delegate :display_blank_codes, :keychain_height, :keychain_width, :max_number_of_keys_per_type, to: :setting

  private

  def only_one_row
    false if RealStateAgency.count > 0
  end

end
