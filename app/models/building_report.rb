class BuildingReport < ApplicationRecord

  def self.filter(params)
    resources = Building.all

    resources = resources.actives                              if params[:active] == '1'
    resources = resources.by_source(params[:source])           unless params[:source].blank?
    resources = resources.by_person_id(params[:owner])         unless params[:owner].blank?
    resources = resources.by_status(params[:status])           unless params[:status].blank?
    resources = resources.gteq_code(params[:initial_sequence]) unless params[:initial_sequence].blank?
    resources = resources.lteq_code(params[:final_sequence])   unless params[:final_sequence].blank?

    resources.order_by_key_code
  end
end
