class PagesController < CrudController

  def index
    @buildings = Building.paginate(page: params['building'])
    @keys      = Key.paginate(page: params['key']).order_by_source_and_code.actives
    @people    = Person.paginate(page: params['people'])
    @owners    = Person.owners.paginate(page: params['owner'])
    @visitors  = Person.visitors.paginate(page: params['visitor'])
    @realtors  = Person.realtors.paginate(page: params['realtor'])
    @visits    = Visit.paginate(page: params['visit'])

    @keys      = @keys.search(params[:search], params[:source])  if params[:search] && params[:tab] == 'key'
    @buildings = @buildings.search(params[:search])              if params[:search] && params[:tab] == 'building'
    @owners    = @owners.search(params[:search])                 if params[:search] && params[:tab] == 'owner'
    @visitors  = @visitors.search(params[:search])               if params[:search] && params[:tab] == 'visitor'
    @realtors  = @realtors.search(params[:search])               if params[:search] && params[:tab] == 'realtor'
    @visits    = @visits.search(params[:search])                 if params[:search] && params[:tab] == 'visit'

    @tab = params[:tab]
  end
end
