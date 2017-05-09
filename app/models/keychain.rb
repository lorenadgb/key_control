class Keychain < ApplicationRecord

  def self.filter(params)
    resources = Key.all
    resources = resources.by_code(params[:key_code])           unless params[:key_code].blank?
    resources = resources.by_building_id(params[:building])    unless params[:building].blank?
    resources = resources.by_owner_id(params[:owner])          unless params[:owner].blank?
    resources = resources.by_source(params[:source])           if params[:all] == '0'
    resources = resources.gteq_code(params[:initial_sequence]) unless params[:initial_sequence].blank?
    resources = resources.lteq_code(params[:final_sequence])   unless params[:final_sequence].blank?

    resources.order_by_source_and_code.actives
  end

end
