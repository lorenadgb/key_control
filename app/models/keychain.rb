class Keychain < ApplicationRecord

  def self.filter(params)
    resources = Key.all
    resources = resources.by_code(params[:key_code]) unless params[:key_code].blank?
    resources = resources.by_building_id(params[:building]) unless params[:building].blank?
    resources = resources.by_owner_id(params[:owner]) unless params[:owner].blank?

    resources
  end

end
