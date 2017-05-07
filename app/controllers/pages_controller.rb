class PagesController < CrudController

  def index
    @buildings = Building.paginate(page: params['building'])
    @keys      = Key.paginate(page: params['key']).order_by_source_and_code.actives
    @people    = Person.paginate(page: params['people'])
    @owners    = Person.owners.paginate(page: params['owner'])
    @visitors  = Person.visitors.paginate(page: params['visitor'])
    @realtors  = Person.realtors.paginate(page: params['realtor'])
    @visits    = Visit.paginate(page: params['visit'])

    @tab = params[:tab]
  end
end
