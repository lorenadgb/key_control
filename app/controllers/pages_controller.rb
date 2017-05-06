class PagesController < CrudController

  def index
    @buildings = Building.paginate(page: params[:page])
    @keys      = Key.paginate(page: params[:page]).order_by_source_and_code.actives
    @people    = Person.paginate(page: params[:page])
    @owners    = Person.owners.paginate(page: params[:page])
    @visitors  = Person.visitors.paginate(page: params[:page])
    @realtors  = Person.realtors.paginate(page: params[:page])
    @visits    = Visit.paginate(page: params[:page])

    @tab = params[:tab]
  end
end
