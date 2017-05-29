class VisitReport < ApplicationRecord

  def self.filter(params)
    resources = Visit.all

    resources = resources.by_owner_id(params[:owner])        unless params[:owner].blank?
    resources = resources.by_visitor_id(params[:visitor])    unless params[:visitor].blank?
    resources = resources.by_realtor_id(params[:realtor])    unless params[:realtor].blank?
    resources = resources.by_building_id(params[:building])  unless params[:building].blank?
    resources = resources.by_key_id(params[:key])            unless params[:key].blank?
    resources = resources.gteq_start_at(Date.parse("%#{params[:start]}%", '%d/%m/%Y').to_time)      unless params[:start].blank?
    resources = resources.lteq_finished_at(Date.parse("%#{params[:finish]}%", '%d/%m/%Y').to_time)  unless params[:finish].blank?

    resources.ordered
  end
end
